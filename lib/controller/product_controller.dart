import 'dart:convert';

import 'package:apitest/model/product.dart';
import 'package:apitest/model/product_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  // Observable to store the summary product list
  var products = <Product>[].obs;
  var isLoading = true.obs;

  // Observable to store the detail for a single product
  var productDetail = Rx<ProductDetail?>(null); 
  var isLoadingDetail = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); // Fetch product summaries initially
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> productsJson = data['products'];

        // Cập nhật danh sách sản phẩm
        products.value = productsJson.map((productJson) => Product.fromJson(productJson)).toList();
      } else {
        throw Exception('Failed to load products summary');
      }
    } catch (e) {
      // Xử lý lỗi đây nếu có
      print("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchProductDetail(int id) async {
    try {
      isLoadingDetail(true);
      final response = await http.get(Uri.parse('https://dummyjson.com/products/$id'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Cập nhật chi tiết cho một sản phẩm duy nhất
        productDetail.value = ProductDetail.fromJson(data);
      } else {
        throw Exception('Failed to load product detail');
      }
    } catch (e) {
      // Xử lý lỗi ở đây nếu có
      print("Error fetching product detail: $e");
    } finally {
      isLoadingDetail(false);
    }
  }
}