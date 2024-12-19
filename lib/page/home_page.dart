import 'package:apitest/components/item1.dart';
import 'package:apitest/components/item2.dart';
import 'package:apitest/components/my_drawer.dart';
import 'package:apitest/controller/product_controller.dart';
import 'package:apitest/page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('GemStore'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryButton('Female', 'lib/images/femenine.png'),
                  _buildCategoryButton('Men', 'lib/images/male-gender.png'),
                  _buildCategoryButton('Accessories', 'lib/images/sunglasses.png'),
                  _buildCategoryButton('Beauty', 'lib/images/lipstick.png'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'lib/images/hinh4.jpg',
                  width: 350,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Feature Products', () {}),
            Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (productController.products.isEmpty) {
                return const Center(child: Text('No products found'));
              }
              return _buildVerticalProductList(productController.products);
            }),
            const SizedBox(height: 30),
            _buildSectionTitle('Recommended', () {}),
            Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (productController.products.isEmpty) {
                return const Center(child: Text('No products found'));
              }
              return _buildHorizontalProductList(productController.products);
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onShowAll) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: onShowAll,
            child: const Text(
              'Show all',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalProductList(List<dynamic> products) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products.map((product) {
          return GestureDetector(
            onTap: () {
              // Mở chi tiết sản phẩm
              productController.fetchProductDetail(product.id); // Lấy chi tiết sản phẩm
              Get.to(ProductDetailPage(productId: product.id)); // Chuyển hướng đến trang chi tiết
            },
            child: ProductCard1(
              imageUrl: product.thumbnail,
              title: product.title,
              price: product.price,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildVerticalProductList(List<dynamic> products) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products.map((product) {
          return GestureDetector(
            onTap: () {
              // Mở chi tiết sản phẩm
              productController.fetchProductDetail(product.id); // Lấy chi tiết sản phẩm
              Get.to(ProductDetailPage(productId: product.id)); // Chuyển hướng đến trang chi tiết
            },
            child: ProductCard(
              imageUrl: product.thumbnail,
              title: product.title,
              price: product.price,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryButton(String text, String imagePath) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Xử lý sự kiện nhấn vào danh mục
          },
          child: Image.asset(imagePath, width: 30, height: 20),
        ),
        const SizedBox(height: 8),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}