import 'package:apitest/service/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var userInfo = {}.obs;

  final AuthService _authService = AuthService();

  /// Hàm đăng nhập
  void login() async {
    if (username.isEmpty || password.isEmpty) {
      errorMessage.value = 'Email and Password are required!';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final token = await _authService.login(username.value, password.value);  
      final user = await _authService.getCurrentUser(token);
      userInfo.value = user;  
      Get.snackbar('Success', 'Logged in successfully!');
      Get.offAllNamed('/home');
    } catch (e) {
      errorMessage.value = e.toString();
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
