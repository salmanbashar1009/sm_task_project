import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/models/post_model.dart';
import '../../core/services/api_service.dart';
import '../../core/services/cache_service.dart';

class PostController extends GetxController {
  final ApiService _apiService = ApiService();
  final CacheService _cacheService = CacheService();

  RxList posts = <Post>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxBool isOffline = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    isLoading(true);
    hasError(false);
    isOffline(false);

    try {
      /// Try to fetch from API
      final fetchedPosts = await _apiService.fetchPosts();
      posts.assignAll(fetchedPosts);

      /// Save to cache
      await _cacheService.cachePosts(fetchedPosts);
    } catch (e, stack) {
      debugPrint("API fetch failed: $e");
      debugPrint(stack.toString());

      /// Try cache if available
      if (_cacheService.hasCachedData()) {
        final cachedPosts = _cacheService.getCachedPosts();
        posts.assignAll(cachedPosts);
        isOffline(true);
      } else {
        hasError(true);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshPosts() async {
    await fetchPosts();
  }
}
