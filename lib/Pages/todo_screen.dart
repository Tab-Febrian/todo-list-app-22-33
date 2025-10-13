import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Fragments/Mobile_Fragments/todo_mobile_fragment.dart';
import 'package:todo_list_app/Fragments/WideScreen_Fragments/todo_wide_fragment.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});
  final todocontroller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          todocontroller.updateLayout(constraints);
          return Obx(
            () => todocontroller.isMobile.value
                ? TodoMobile()
                : TodoWide(),
          );
        },
      ),
    );
  }
}