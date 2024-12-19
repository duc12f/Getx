import 'package:apitest/components/custom_button.dart';
import 'package:apitest/components/login_with_button.dart';
import 'package:apitest/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create',
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
              const CustomTextField(
                hintText: 'Enter your name',
                isPassword: false,
              ),
              const SizedBox(height: 10),
               const CustomTextField(
                hintText: 'Email address',
                isPassword: false,
              ),
              const SizedBox(height: 10),
               const CustomTextField(
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                hintText: 'Confirm Password',
                isPassword: true,
              ),
              
              const SizedBox(height: 50),
              CustomButton(
                  text: 'SIGN UP',
                  color: Colors.black,
                  borderRadius: 30,
                  width: 150,
                  height: 20,
                  onPressed: () {}),
              const SizedBox(height: 30),
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
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {Get.toNamed('/login');},
                    child: const Text(
                      "Log In",
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
          ),
        ),
      ),
    );
  }
}
