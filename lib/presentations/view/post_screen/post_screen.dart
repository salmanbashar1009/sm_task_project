import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/post_controller.dart';

class PostScreen extends StatelessWidget {
   PostScreen({super.key});
  final PostController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        // backgroundColor: Colors.transparent,
        title: Obx(() => Text(controller.isOffline.value
            ? 'Posts (Offline Mode)'
            : 'Posts')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refreshPosts,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.hasError.value) {
          return const Center(
            child: Text('Failed to load posts. Please check your connection.'),
          );
        }

        if (controller.posts.isEmpty) {
          return const Center(child: Text('No posts available'));
        }

        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(
                  post.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(post.body),
                trailing: Text('#${post.id}'),
              ),
            );
          },
        );
      }),
    );
  }
}