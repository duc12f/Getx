// Assuming you have a CartItem model
import 'package:apitest/components/items_cart.dart';
import 'package:apitest/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Update with the correct import

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the CartController instance
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Are you sure want to clear the cart?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        cartController.clearCart(); // Clear cart using GetX
                      },
                      child: const Text('YES'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        height: 50,
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Payment',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Obx(() {
        final useCart = cartController.cartItems; // Get the reactive cart items
        return Column(
          children: [
            Expanded(
              child: useCart.isEmpty
                  ? const Center(child: Text('Cart is Empty'))
                  : ListView.builder(
                      itemCount: useCart.length,
                      itemBuilder: (context, index) {
                        final cartItem = useCart[index];
                        return MyCartTitle(cartItem: cartItem);
                      },
                    ),
            ),
            const SizedBox(height: 20),
          ],
        );
      }),
    );
  }
}
