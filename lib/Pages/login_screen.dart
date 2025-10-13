import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/Controllers/auth_controller.dart';
import 'package:todo_list_app/Fragments/Mobile_Fragments/login_mobile_fragment.dart';
import 'package:todo_list_app/Fragments/WideScreen_Fragments/login_wide_fragment.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final loginController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          loginController.updateLayout(constraints);
          return Obx(
            () => loginController.isMobile.value
                ? LoginMobile()
                : LoginWide(),
          );
        },
      ),
    );
  }
}