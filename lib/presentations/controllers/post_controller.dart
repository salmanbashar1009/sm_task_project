import 'package:get/get.dart';

import '../../core/models/post_model.dart';
import '../../core/services/api_service.dart';
import '../../core/services/cache_service.dart';


class PostController extends GetxController {
  final ApiService _apiService = ApiService();
  final CacheService _cacheService = CacheService();

  var posts = <Post>[].obs;
  var isLoading = true.obs;
  var hasError = false.obs;
  var isOffline = false.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      hasError(false);
      isOffline(false);

      // Try to fetch from API
      final fetchedPosts = await _apiService.fetchPosts();
      posts.assignAll(fetchedPosts);

      // Cache the fetched data
      await _cacheService.cachePosts(fetchedPosts);
    } catch (e) {
      // If API fails, try to load from cache
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

  void refreshPosts() {
    fetchPosts();
  }
}