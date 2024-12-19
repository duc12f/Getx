import 'package:apitest/model/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  // Thêm sản phẩm vào giỏ hàng
  void addToCart(CartItem item) {
    // Kiểm tra nếu sản phẩm đã có trong giỏ hàng
    var existingItemIndex =
        cartItems.indexWhere((cartItem) => cartItem.id == item.id);

    if (existingItemIndex != -1) {
      // Tăng số lượng nếu sản phẩm đã có
      cartItems[existingItemIndex] = cartItems[existingItemIndex].copyWith(
        quantity: cartItems[existingItemIndex].quantity + item.quantity,
      );
    } else {
      // Thêm sản phẩm mới
      cartItems.add(item);
    }
  }

  // Xóa sản phẩm khỏi giỏ hàng
  void removeFromCart(int itemId) {
    cartItems.removeWhere((cartItem) => cartItem.id == itemId);
  }

  // Cập nhật số lượng sản phẩm trong giỏ hàng
  void updateQuantity(int itemId, int newQuantity) {
    var existingItemIndex =
        cartItems.indexWhere((cartItem) => cartItem.id == itemId);

    if (existingItemIndex != -1) {
      if (newQuantity > 0) {
        // Cập nhật số lượng
        cartItems[existingItemIndex] = cartItems[existingItemIndex].copyWith(
          quantity: newQuantity,
        );
      } else {
        // Nếu số lượng <= 0, xóa sản phẩm khỏi giỏ
        removeFromCart(itemId);
      }
    }
  }

  // Tính tổng số sản phẩm trong giỏ hàng
  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Tính tổng giá trị giỏ hàng
  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + (item.price * item.quantity));

  // Xóa tất cả sản phẩm trong giỏ hàng
  void clearCart() {
    cartItems.clear();
  }
}
