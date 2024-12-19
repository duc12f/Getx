import 'package:apitest/components/my_drawer_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //app logo
          children: [
            MyDrawerTitle(icon: Icons.home, onTap: (){
              Get.toNamed('/home');
            }, text: 'Home'),
            MyDrawerTitle(icon: Icons.comment, onTap: (){
              Get.toNamed('/post');
            }, text: 'Post'),
            MyDrawerTitle(icon: Icons.person, onTap: (){
              Get.toNamed('/user');
            }, text: 'User'),
            const Spacer(),
            MyDrawerTitle(icon: Icons.logout, onTap: (){
              Get.toNamed('/');
            }, text: 'Log Out'),
          ],
        ),
      ),
    );
  }
}