import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Routes/routes.dart';
import 'package:todo_list_app/Widgets/reusable_button.dart';
import 'package:todo_list_app/Widgets/profile_card.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    
    final users = [
      {
        "name": "Riffat Arfa Pramana",
        "absen": "33",
        "kelas": "XI PPLG 1",
        "imageUrl": "https://imageio.forbes.com/specials-images/imageserve/645ea1c4fce09061884bd21c/0x0.jpg?format=jpg&crop=2774,2772,x925,y0,safe&height=416&width=416&fit=bounds",
      },
      {
        "name": "Muhammad Febrian",
        "absen": "22",
        "kelas": "XI PPLG 1",
        "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxLoJONSCCuN_JBwM_xVD5hloPBf4pHB9R7A&s",
      },
    ];

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              for (var user in users)
                ProfileCard(
                  name: user["name"]!,
                  absen: user["absen"]!,
                  kelas: user["kelas"]!,
                  imageUrl: user["imageUrl"]!,
                ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.all(16),
                child: ReusableButton(
                  text: "Logout",
                  color: const Color.fromARGB(255, 255, 68, 68),
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.login);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
