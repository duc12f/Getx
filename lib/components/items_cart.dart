import 'package:apitest/components/my_quantity_selector.dart';
import 'package:apitest/controller/cart_controller.dart';
import 'package:apitest/model/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartTitle extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTitle({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController =
        Get.find<CartController>(); // Lấy CartController

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Màu nền nhẹ
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              cartItem.thumbnail, // Truy cập hình ảnh sản phẩm qua URL
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.title, // Tên sản phẩm
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${cartItem.price.toStringAsFixed(2)}', // Giá sản phẩm
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                MyQuantitySelector(
                  quantity: cartItem.quantity,
                  onDecrement: () {
                    // Giảm số lượng sản phẩm, nếu số lượng <= 1, xóa sản phẩm
                    if (cartItem.quantity > 1) {
                      cartController.updateQuantity(
                          cartItem.id, cartItem.quantity - 1);
                    } else {
                      cartController.removeFromCart(cartItem.id);
                    }
                  },
                  onIncrement: () {
                    // Tăng số lượng sản phẩm
                    cartController.updateQuantity(
                        cartItem.id, cartItem.quantity + 1);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
