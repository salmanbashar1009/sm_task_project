import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http ;
import '../models/post_model.dart';
import '../urls/urls.dart';

class ApiService {

  Future<List<Post>> fetchPosts() async {
    try {
      final url = Uri.parse(Urls.postUrl);
      debugPrint("🌍 Fetching posts from $url");

      final response = await http.get(url);

      debugPrint("📡 Response status: ${response.statusCode}");
      debugPrint("📡 Response body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> postsJson = data['posts'];
        return postsJson.map((e) => Post.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load posts: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Network/Parsing error: $e");
      rethrow;
    }
  }
}
