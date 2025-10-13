import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/auth_controller.dart';
import 'package:todo_list_app/Widgets/reusable_button.dart';
import 'package:todo_list_app/Widgets/reusable_textfield.dart';
import 'package:todo_list_app/Widgets/reusable_card.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';

class LoginMobile extends StatelessWidget {
  LoginMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SingleChildScrollView(
          child: ReusableCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.teal,
                ),
                const SizedBox(height: 10),
                const ReusableText(
                  text: 'Welcome! (Mobile)',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 30),
                ReusableTextField(
                  label: "Username",
                  controller: loginController.usernameController,
                ),
                const SizedBox(height: 16),
                ReusableTextField(
                  label: "Password",
                  controller: loginController.passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 30),
                ReusableButton(
                  text: 'Login',
                  color: Colors.teal,
                  onPressed: () {
                    loginController.login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
