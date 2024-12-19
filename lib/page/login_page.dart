import 'package:apitest/components/custom_button.dart';
import 'package:apitest/components/login_with_button.dart';
import 'package:apitest/components/text_field.dart';
import 'package:apitest/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController()); // Tạo instance của AuthController

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Log into',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'your account',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                // Email TextField
                CustomTextField(
                  hintText: 'Username',
                  isPassword: false,
                  onChanged: (value) {
                    authController.username.value = value; // Cập nhật email
                  },
                ),
                const SizedBox(height: 10),
                // Password TextField
                CustomTextField(
                  hintText: 'Password',
                  isPassword: true,
                  onChanged: (value) {
                    authController.password.value = value; // Cập nhật password
                  },
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'LOG IN',
                  color: Colors.black,
                  borderRadius: 30,
                  width: 150,
                  height: 50,
                  onPressed: () {
                    authController.login();
                  },
                ),
                const SizedBox(height: 20),
                if (authController.isLoading.value)
                  const CircularProgressIndicator(), // Hiển thị vòng tròn loading
                if (authController.errorMessage.isNotEmpty)
                  Text(
                    authController.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                const Text(
                  'Or login with',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginWithButton(onPressed: () {}, url: 'lib/images/apple.png'),
                    LoginWithButton(onPressed: () {}, url: 'lib/images/google.png'),
                    LoginWithButton(onPressed: () {}, url: 'lib/images/face.png'),
                  ],
                ),
                const SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Chuyển sang màn hình đăng ký
                        Get.toNamed('/signup');
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
