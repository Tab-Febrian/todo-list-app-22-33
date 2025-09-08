import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Routes/routes.dart';
import 'package:todo_list_app/Widgets/reusable_button.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://en.gundam.info/about-gundam/series-pages/gquuuuuux/glh/jp/character/2025/02/img_thumb_11_01.png",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "AdminGan",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "admin",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Container(
              margin: EdgeInsets.all(16),
              child: ReusableButton(
                text: "Logout",
                color: Colors.blueAccent,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
