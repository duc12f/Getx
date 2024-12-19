import 'dart:convert';

import 'package:apitest/model/post.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  // Danh sách bài viết
  var posts = <Post>[].obs;

  // Trạng thái tải dữ liệu
  var isLoading = true.obs;

  // API URL
  final String apiUrl = "https://dummyjson.com/posts";

  @override
  void onInit() {
    super.onInit();
    fetchPosts(); // Gọi API khi controller được khởi tạo
  }

  /// Lấy danh sách bài viết từ API
  Future<void> fetchPosts() async {
    try {
      isLoading(true); // Bắt đầu tải dữ liệu
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['posts'] as List;
        posts.value = jsonData.map((data) => Post.fromJson(data)).toList();
      } else {
        Get.snackbar("Error", "Failed to fetch posts");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading(false); // Kết thúc quá trình tải
    }
  }
}
