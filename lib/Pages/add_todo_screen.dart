import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Fragments/Mobile_Fragments/add_todo_mobile_fragment.dart';
import 'package:todo_list_app/Fragments/WideScreen_Fragments/add_todo_wide_fragment.dart';

class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({super.key});
  final addtodocontroller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final isMobileNow = constraints.maxWidth < 600;
            if (addtodocontroller.isMobile.value != isMobileNow) {
              addtodocontroller.isMobile.value = isMobileNow;
            }
          });
          return Obx(
            () => addtodocontroller.isMobile.value
                ? AddTodoMobile()
                : AddTodoWide(),
          );
        },
      ),
    );
  }
}
