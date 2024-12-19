
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double width;  
  final double height; 
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.borderRadius = 8.0,
    required this.onPressed, required this.width, required this.height,
  
    
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Màu của button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // Độ bo tròn góc
        ),
        minimumSize: Size(width, height), // Kích thước của button
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold),
      ),
    );
  }
}
