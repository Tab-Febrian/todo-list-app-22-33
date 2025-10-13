import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:todo_list_app/Controllers/auth_controller.dart';
import 'package:todo_list_app/Fragments/Mobile_Fragments/profile_mobile_fragment.dart';
import 'package:todo_list_app/Fragments/WideScreen_Fragments/profile_wide_fragment.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final profilecontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          profilecontroller.updateLayout(constraints);
          return Obx(
            () => profilecontroller.isMobile.value
                ? ProfileMobile()
                : ProfileWide(),
          );
        },
      ),
    );
  }
}