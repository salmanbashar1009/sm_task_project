import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http ;
import '../models/post_model.dart';
import '../urls/urls.dart';

class ApiService {

  // Future<List<Post>> fetchPosts() async {
  //   try {
  //     final url = Uri.parse(Urls.postUrl);
  //     debugPrint("Fetching posts from $url");
  //
  //     final response = await http.get(url);
  //
  //     debugPrint("📡 Response status: ${response.statusCode}");
  //     debugPrint("📡 Response body: ${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       final List<dynamic> postsJson = data['posts'];
  //       return postsJson.map((e) => Post.fromJson(e)).toList();
  //     } else {
  //       throw Exception("Failed to load posts: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     debugPrint("Network/Parsing error: $e");
  //     rethrow;
  //   }
  // }

  Future<List<Post>> fetchPosts() async{
    ///check internet connectivity
    List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

    if (!connectivityResult.contains(ConnectivityResult.none)){
      try{
        final url = Uri.parse(Urls.postUrl);
        final response = await http.get(url);
        if(response.statusCode == 200){
          final data = jsonDecode(response.body);
          return (data['posts'] as List).map((e)=> Post.fromJson(e)).toList();
        }else{
          throw Exception('Failed to load posts');
        }
      } catch (e) {
        debugPrint("Network/parsing error: $e");
      }
    }

  }

}
