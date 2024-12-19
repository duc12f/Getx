import 'package:apitest/controller/cart_controller.dart';
import 'package:apitest/controller/product_controller.dart';
import 'package:apitest/model/cart_item.dart';
import 'package:apitest/model/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductController productController = Get.find();
  final CartController cartController = Get.find();
  final int productId;

  ProductDetailPage({super.key, required this.productId}) {
    productController.fetchProductDetail(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          // Kiểm tra xem productDetail có null hay không
          if (productController.productDetail.value == null) {
            return const Text('Loading...');
          }
          return Text(productController.productDetail.value!.title);
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
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
            onPressed: () {
              ProductDetail? product = productController.productDetail.value;
              if (product != null) {
                // Chuyển ProductDetail thành CartItem
                CartItem cartItem = CartItem(
                  id: product.id,
                  title: product.title,
                  price: product.price,
                  quantity:
                      1, // Mặc định là 1 hoặc thêm lựa chọn số lượng nếu cần
                  thumbnail: product.thumbnail,
                );
                cartController.addToCart(cartItem);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.title} added to cart'),
                  ),
                );
              }
            },
            child: const Text(
              'Add To Cart',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (productController.isLoadingDetail.value) {
          return const Center(child: CircularProgressIndicator());
        }
        ProductDetail? product = productController.productDetail.value;

        if (product == null) {
          return const Center(child: Text('Product not found'));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hình ảnh sản phẩm
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.network(
                        product.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Đánh giá
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 2),
                          blurRadius: 4)
                    ],
                    color: Colors.grey.shade100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            Text('${product.rating}'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Mô tả
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: [
                            Text(
                              product.description,
                              style: const TextStyle(fontSize: 16),
                              softWrap: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Đánh giá
                        const Text(
                          "Reviews",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text("${product.rating} out of 5"),
                        ...product.reviews.map((review) {
                          return ListTile(
                            title: Text(review.reviewerName),
                            subtitle: Text(review.comment),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(review.rating, (index) {
                                return const Icon(Icons.star,
                                    color: Colors.yellow, size: 16);
                              }),
                            ),
                          );
                        }),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
