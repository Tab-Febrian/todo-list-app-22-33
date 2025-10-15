import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/auth_controller.dart';
import 'package:todo_list_app/Widgets/reusable_button.dart';
import 'package:todo_list_app/Widgets/reusable_textfield.dart';
import 'package:todo_list_app/Widgets/reusable_card.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';

class LoginWide extends StatelessWidget {
  LoginWide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SingleChildScrollView(
          child: ReusableCard(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Left icon
                  const Padding(
                    padding: EdgeInsets.only(right: 24.0),
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.teal,
                    ),
                  ),
                  // Right: form
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const ReusableText(
                          text: 'Welcome! (Wide)',
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: ReusableButton(
                            text: 'Login',
                            color: Colors.teal,
                            onPressed: () {
                              loginController.login();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
