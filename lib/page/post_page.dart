import 'package:apitest/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (postController.posts.isEmpty) {
          return const Center(child: Text("No posts found"));
        } else {
          return ListView.builder(
            itemCount: postController.posts.length,
            itemBuilder: (context, index) {
              final post = postController.posts[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(
                    post.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    _showPostDetails(context, post);
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }

  void _showPostDetails(BuildContext context, dynamic post) {
  Get.defaultDialog(
    title: post.title,
    content: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Body:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(post.body),
          const SizedBox(height: 10),
          const Text(
            "Tags:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(post.tags.join(", ")), // Hiển thị danh sách tags
          const SizedBox(height: 10),
          const Text(
            "Reactions:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Likes: ${post.reactions.likes}"), // Truy cập likes qua object
          Text("Dislikes: ${post.reactions.dislikes}"), // Truy cập dislikes qua object
          const SizedBox(height: 10),
          Text(
            "Views: ${post.views}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    textConfirm: "Close",
    onConfirm: () {
      Get.back();
    },
  );
}
}