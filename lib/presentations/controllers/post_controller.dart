import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/models/post_model.dart';
import '../../core/services/api_service.dart';
import '../../core/services/cache_service.dart';

class PostController extends GetxController {
  final ApiService _apiService = ApiService();
  final CacheService _cacheService = CacheService();

  final RxList posts = <Post>[].obs;
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
      final fetchedPosts = await _apiService.fetchPosts();
      posts.assignAll(fetchedPosts);
      await _cacheService.cachePosts(fetchedPosts);  // Already awaited
    } catch (e, stack) {
      debugPrint("API fetch failed: $e");
      debugPrint(stack.toString());

      final hasCache = await _cacheService.hasCachedData();  // Now await
      if (hasCache) {
        final cachedPosts = await _cacheService.getCachedPosts();  // Now await
        if (cachedPosts.isNotEmpty) {
          posts.assignAll(cachedPosts);
          isOffline(true);
        } else {
          hasError(true);
        }
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
