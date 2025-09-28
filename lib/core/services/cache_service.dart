import 'package:hive/hive.dart';

import '../models/post_model.dart';

class  CacheService{
  final Box _box = Hive.box("postCache");

  Future<void> cachePosts(List<Post> posts)async{
    await _box.clear();
    await _box.put('posts', posts.map((post)=>post.toJson()).toList());
  }

  List<Post> getCachedPosts() {
    final cachedData = _box.get('posts');
    if (cachedData != null) {
      return (cachedData as List)
          .map((item) => Post.fromJson(item))
          .toList();
    }
    return [];
  }

  bool hasCachedData() {
    return _box.containsKey('posts');
  }
}