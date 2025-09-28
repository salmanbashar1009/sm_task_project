import 'dart:convert';

import 'package:sm_task_project/core/models/post_model.dart';
import 'package:http/http.dart' as http;

import '../urls/urls.dart';

class ApiService{

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(Urls.postUrl));
    if(response.statusCode == 200){
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Post.fromJson(item)).toList();
    }else{
      throw Exception('Failed to load posts');
    }
  }

}