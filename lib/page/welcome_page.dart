import 'package:apitest/components/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/hinh3.png'), fit: BoxFit.cover)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to GemStore!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30,),
            Text(
              'The home for a fashonista',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 20,),
            CustomButton(
              text: 'Get Started',
              borderRadius: 20,
              width: 200,
              height: 60,
              color: Colors.grey.shade400,
              onPressed: (){}),
              const SizedBox(height: 100,)
          ],
        ),
      ),
    ));
  }
}
