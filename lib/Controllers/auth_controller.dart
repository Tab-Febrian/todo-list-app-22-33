import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Routes/routes.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username == 'admin' && password == '123') {
      Get.snackbar(
        'Login Berhasil!',
        'Selamat datang kembali!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: EdgeInsets.all(10),
      );
      Get.offAllNamed(AppRoutes.nav);
    } else {
      Get.snackbar(
        'Login Gagal!',
        'Username atau password salah.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(10),
      );
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
