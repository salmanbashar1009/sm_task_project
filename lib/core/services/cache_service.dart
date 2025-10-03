import 'package:hive/hive.dart';

import '../models/post_model.dart';

class CacheService {
  Box? _box;
  static const String _boxName = 'postsCache';
  static const String _postsKey = 'posts';

  // Lazy init to ensure box is open
  Future<Box> get _lazyBox async {
    _box ??= Hive.box(_boxName);
    return _box!;
  }

  Future<void> cachePosts(List<Post> posts) async {
    try {
      final box = await _lazyBox;
      // No clear() - just overwrite the key
      await box.put(_postsKey, posts);  // Direct List<Post> storage using adapter
      print('Posts cached directly: ${posts.length} items');  // Debug: Check console
    } catch (e) {
      print('Cache save error: $e');
      rethrow;
    }
  }

  Future<List<Post>> getCachedPosts() async {
    try {
      final box = await _lazyBox;
      final cachedData = box.get(_postsKey);
      if (cachedData == null || (cachedData as List<Post>).isEmpty) {
        print('No cached posts found');  // Debug
        return [];
      }
      final posts = List<Post>.from(cachedData);
      print('Loaded ${posts.length} cached posts');  // Debug
      return posts;
    } catch (e) {
      print('Cache load error: $e');
      return [];
    }
  }

  Future<bool> hasCachedData() async {
    try {
      final box = await _lazyBox;
      final hasData = box.containsKey(_postsKey);
      print('Has cached data: $hasData');  // Debug
      return hasData;
    } catch (e) {
      print('Cache check error: $e');
      return false;
    }
  }

  // Optional: Clear specific key only
  Future<void> clearCache() async {
    final box = await _lazyBox;
    await box.delete(_postsKey);
  }
}