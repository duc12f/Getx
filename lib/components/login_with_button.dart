import 'package:flutter/material.dart';

class LoginWithButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String url;
  const LoginWithButton({super.key, required this.onPressed, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(0),
      ),
      child: 
      Image.asset(url,
      width: 50,
      height: 50,)
      ),
    );
  }
}