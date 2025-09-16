import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/auth_controller.dart';
import 'package:todo_list_app/Widgets/reusable_button.dart';
import 'package:todo_list_app/Widgets/reusable_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 15),
              const Icon(
                Icons.person,
                size: 120,
                color: Colors.teal,
              ),
              const Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
                textAlign: TextAlign.center,
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
              const SizedBox(height: 35),
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
    );
  }
}