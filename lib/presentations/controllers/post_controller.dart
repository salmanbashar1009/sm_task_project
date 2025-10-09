import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/models/post_model.dart';
import '../../core/services/cache_service.dart';
import '../../core/urls/urls.dart';

class PostController extends GetxController {
  final RxList<Post> posts = <Post>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isOffline = false.obs;
  final RxBool hasError = false.obs;


  final CacheService _cacheService = CacheService.cacheService;
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      isOffline.value = false;

      List<ConnectivityResult> connectivityResult = await _connectivity.checkConnectivity();

      if (!connectivityResult.contains(ConnectivityResult.none)) {
        final response = await http.get(Uri.parse(Urls.postUrl)).timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw Exception('Request timed out'),
        );

        if (response.statusCode == 200) {
          /// Cache in background isolate
          try {
            await _cacheService.cachePostsInIsolate(response.body);
          } catch (e) {
            debugPrint('Cache isolate failed: $e');
          }

          /// Load freshly cached posts
          final cachedPosts = await _cacheService.getCachedPosts();
          posts.assignAll(cachedPosts);
        } else {
          throw Exception('Failed to load posts: ${response.statusCode}');
        }
      } else {
        await _loadFromCache();
      }
    } catch (e, stack) {
      debugPrint('Error fetching posts: $e');
      debugPrint(stack.toString());
      await _loadFromCache();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadFromCache() async {
    try {
      final hasCache = await _cacheService.hasCachedData();
      if (hasCache) {
        final cachedPosts = await _cacheService.getCachedPosts();
        if (cachedPosts.isNotEmpty) {
          posts.assignAll(cachedPosts);
          isOffline.value = true;
          return;
        }
      }
      hasError.value = true;
    } catch (e, stack) {
      debugPrint('Error loading cached posts: $e');
      debugPrint(stack.toString());
      hasError.value = true;
    }
  }

  Future<void> refreshPosts() async {
    await fetchPosts();
  }

  @override
  void onClose() {
    posts.close();
    isLoading.close();
    isOffline.close();
    hasError.close();
    super.onClose();
  }
}