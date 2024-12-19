import 'package:flutter/material.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const MyQuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300, // Màu nền tĩnh
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onDecrement,
              child: const Icon(
                Icons.remove,
                size: 20,
                color: Colors.red, // Màu biểu tượng tĩnh
              ),
            ),
            // Hiển thị số lượng
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Màu chữ tĩnh
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: onIncrement,
              child: const Icon(
                Icons.add,
                size: 20,
                color: Colors.green, // Màu biểu tượng tĩnh
              ),
            ),
          ],
        ),
      ),
    );
  }
}
