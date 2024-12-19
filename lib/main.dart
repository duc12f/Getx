import 'package:apitest/controller/cart_controller.dart';
import 'package:apitest/page/cart_page.dart';
import 'package:apitest/page/current_user_page.dart';
import 'package:apitest/page/home_page.dart';
import 'package:apitest/page/login_page.dart';
import 'package:apitest/page/post_page.dart';
import 'package:apitest/page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GemStore',
      home: LoginPage(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/home', page: () => HomePage(),),
        GetPage(name: '/post', page: () =>  PostPage(),),
        GetPage(name: '/cart', page: () => const CartPage(),),
        GetPage(name: '/signup', page: () => const RegisterPage(),),
        GetPage(name: '/login', page: () => LoginPage(),),
        GetPage(name: '/user', page: () => CurrentUserPage(),)
      ],
    );
  }
}