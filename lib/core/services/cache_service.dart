import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../models/post_model.dart';

class CacheService {
  late final Box _box;
  static const String _boxName = 'postsCache';
  static const String _postsKey = 'posts';

  CacheService._();  /// private constructor for singleton

  static final CacheService cacheService = CacheService._();


  /// initialize hive and open box
  Future<void> init() async{
    try{
      _box = await Hive.openBox(_boxName);
      if(kDebugMode){
        print('CacheService: Hive box $_boxName opened successfully');
      }
    }catch(e){
      if(kDebugMode){
        print("CacheService: Failed to initialize hive box: $e");
      }
      rethrow;
    }
  }

  /// cache posts to hive
Future<void> cachePosts(List<Post> posts)async{
    try{
      await _box.put(_postsKey, posts);
      if(kDebugMode){
        print("CacheServices: Cached ${posts.length} posts");
      }
    }catch(e){
      if(kDebugMode){
        print("CacheServices: Failed to cache posts: $e");
      }
      rethrow;
    }
}

 /// Retrieve cached posts
Future<List<Post>> getCachedPosts() async {
    try{
      final cachedData = await  _box.get(_postsKey);
      if(cachedData == null || cachedData.isEmpty){
        if(kDebugMode){
          print("CacheServices: No cached posts found");
        }
        return [];
      }
      final posts = (cachedData as List<dynamic>).cast<Post>();
      if(kDebugMode){
        print('CacheServices: Loaded ${posts.length} cached posts');
      }
      return posts;
    }catch(e){
      if (kDebugMode) {
        print('CacheService: Failed to load cached posts: $e');
      }
      return [];
    }
}

/// check if cache contains data
Future<bool> hasCachedData()async{
    try{
      final hasData = _box.containsKey(_postsKey) && _box.get(_postsKey)?.isNotEmpty == true;
      if(kDebugMode){
        print("CacheServices: Has cached data: $hasData");
      }
      return hasData;
    }catch(e){
      if(kDebugMode){
        print("CacheServices: Error checking cache: $e");
      }
      return false;
    }
}

/// close the hive box (should be called when app is terminated)
Future<void> close() async{
    try{
      await _box.close();
      if(kDebugMode){
        print("CacheServices: Hive box $_boxName closed");
      }
    }catch(e){
      if(kDebugMode){
        print("CacheServices: Error closing hive box: $e");
      }
    }
}
}