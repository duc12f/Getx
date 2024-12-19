import 'package:flutter/material.dart';

class VerticalButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  

  const VerticalButton({
    super.key,
    required this.imagePath,
    required this.text,
    this.textColor = Colors.black,
    required this.onPressed,
     // Kích thước mặc định của hình ảnh
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 20,
            height: 20,
          ),
          const SizedBox(height: 5), 
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
