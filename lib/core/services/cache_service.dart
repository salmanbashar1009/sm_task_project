import 'dart:convert';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/post_model.dart';

class CacheService {
  static const String _boxName = 'postsCache';
  static const String _postsKey = 'posts';

  CacheService._();
  static final CacheService cacheService = CacheService._();

  Box? _box;
  String? _hiveDirPath;

  /// Ensure Hive and box are ready
  Future<void> _ensureBoxReady() async {
    if (_box != null && _box!.isOpen) return;
    _hiveDirPath ??= (await getApplicationDocumentsDirectory()).path;
    Hive.init(_hiveDirPath!);
    _box = await Hive.openBox(_boxName);
    if (kDebugMode) print('CacheService: Hive box $_boxName is ready');
  }

  Future<void> init() async => _ensureBoxReady();

  /// Entry point for isolate caching
  static Future<void> _cachePostsIsolate(Map<String, dynamic> args) async {
    final jsonString = args['jsonString'] as String;
    final SendPort sendPort = args['sendPort'];
    final String hiveDir = args['hiveDir'] as String;
    final RootIsolateToken rootToken = args['rootIsolateToken'] as RootIsolateToken;

    try {
      // Enable platform channel access in isolate (for path_provider)
      BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);

      Hive.init(hiveDir);
      final box = await Hive.openBox(_boxName);

      final decoded = jsonDecode(jsonString);
      final posts = (decoded['posts'] as List)
          .map((e) => Post.fromJson(e))
          .toList();

      final serialized = posts.map((e) => e.toJson()).toList();
      await box.put(_postsKey, serialized);

      await box.close();
      sendPort.send('success');
    } catch (e) {
      sendPort.send('error: $e');
    }
  }

  /// Cache posts in background isolate safely
  Future<void> cachePostsInIsolate(String jsonString) async {
    await _ensureBoxReady();
    final receivePort = ReceivePort();

    final rootToken = RootIsolateToken.instance;
    if (rootToken == null) {
      throw Exception("RootIsolateToken is null. Must call from Flutter context.");
    }

    await Isolate.spawn<Map<String, dynamic>>(
      _cachePostsIsolate,
      {
        'jsonString': jsonString,
        'sendPort': receivePort.sendPort,
        'hiveDir': _hiveDirPath!,
        'rootIsolateToken': rootToken,
      },
    );

    final result = await receivePort.first;
    if (result.toString().startsWith('error')) {
      throw Exception(result);
    }

    if (kDebugMode) print('CacheService: cached posts in isolate successfully');
  }

  /// Retrieve cached posts
  Future<List<Post>> getCachedPosts() async {
    await _ensureBoxReady();
    try {
      final cachedData = _box!.get(_postsKey);
      if (cachedData == null || cachedData.isEmpty) {
        if (kDebugMode) print("CacheService: No cached posts found");
        return [];
      }

      final posts = (cachedData as List)
          .map((e) => Post.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      if (kDebugMode) {
        print('CacheService: Loaded ${posts.length} cached posts');
      }
      return posts;
    } catch (e) {
      if (kDebugMode) {
        print('CacheService: Failed to load cached posts: $e');
      }
      return [];
    }
  }

  Future<bool> hasCachedData() async {
    await _ensureBoxReady();
    try {
      final hasData = _box!.containsKey(_postsKey) &&
          (_box!.get(_postsKey)?.isNotEmpty == true);
      if (kDebugMode) print("CacheService: Has cached data: $hasData");
      return hasData;
    } catch (e) {
      if (kDebugMode) print("CacheService: Error checking cache: $e");
      return false;
    }
  }

  Future<void> close() async {
    try {
      if (_box != null && _box!.isOpen) {
        await _box!.close();
        if (kDebugMode) print("CacheService: Hive box $_boxName closed");
      }
    } catch (e) {
      if (kDebugMode) print("CacheService: Error closing hive box: $e");
    }
  }
}
