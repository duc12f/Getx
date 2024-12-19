import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final ValueChanged<String>? onChanged; // Thêm onChanged

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.onChanged, // Nhận giá trị callback
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword, // Ẩn mật khẩu nếu là trường password
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      onChanged: onChanged, // Gọi hàm callback khi giá trị thay đổi
    );
  }
}
