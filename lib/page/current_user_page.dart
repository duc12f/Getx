
import 'package:apitest/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentUserPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  CurrentUserPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Current User")),
      body: Obx(() {
        if (authController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (authController.userInfo.isEmpty) {
          return const Center(child: Text("No user information available"));
        } else {
          final user = authController.userInfo;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                  
                    CircleAvatar(
                      backgroundImage: NetworkImage(user['image'] ?? ''),
                      radius: 35, 
                    ),
                    const SizedBox(width: 16), 
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID: ${user['id']}"),
                        Text("Name: ${user['firstName']} ${user['lastName']}"),
                        Text("Email: ${user['email']}"),
                        Text("Username: ${user['username']}"),
                        Text("Gender: ${user['gender']}"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
