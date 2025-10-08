import 'dart:convert';
import 'dart:isolate';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../core/models/post_model.dart';
import '../../core/services/cache_service.dart';
import '../../core/urls/urls.dart';

class PostController extends GetxController {
  final RxList posts = <Post>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isOffline = false.obs;
  final RxBool hasError = false.obs;

  final CacheService _cacheService = CacheService.cacheService;
  final

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      isOffline.value = false;
      hasError.value = false;

      List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

      if (!connectivityResult.contains(ConnectivityResult.none)){
        final url = Uri.parse(Urls.postUrl);
        final response = await http.get(url);
        if(response.statusCode == 200){
          final data = jsonDecode(response.body);
          final fetchedPosts = (data['posts'] as List).map((e)=> Post.fromJson(e)).toList();
          /// run caching in isolate
          final receivePort = ReceivePort();
          await Isolate.spawn(_cachePostsInIsolator, [
            _cacheService,
            fetchedPosts,
            receivePort.sendPort
          ]);
          /// wait for isolate completion
          final cacheSuccess = await receivePort.first as bool;
          if(!cacheSuccess){
            if(kDebugMode){
              print("Failed to cache posts in isolate");
            }
          }
          posts.assignAll(fetchedPosts);
        }else{
          throw Exception('Failed to load posts: ${response.statusCode}');
        }
      }else{
        /// load cache data here
        await _loadCacheData();
      }
    } catch (e,stack) {
      if(kDebugMode){
        print("Error fetching posts: $e");
        print(stack.toString());
        await _loadCacheData();

      }
    } finally {
     isLoading.value = false;
    }
  }

  Future<void> _loadCacheData()async{
    try{
      final hasCache = await _cacheService.hasCachedData();
      if(hasCache){
        final cachedPosts = await _cacheService.getCachedPosts();
        if(cachedPosts.isNotEmpty){
          posts.assignAll(cachedPosts);
          isOffline.value = true;
          return;
        }
      }
    }catch(e){
      if(kDebugMode){
        print('Error loading cached posts: $e');
      }
      hasError.value = true;
    }
  }

  Future<void> refreshPosts() async {
    await fetchPosts();
  }
}

void _cachePostsInIsolator(List<dynamic> args)async{
  final cacheService = args[0] as CacheService;
  final posts = args[1] as List<Post>;
  final sendPort = args[2] as SendPort;
  try{
    await cacheService.cachePosts(posts);
    sendPort.send(true);
  }catch(e){
    sendPort.send(false);
  }
}
