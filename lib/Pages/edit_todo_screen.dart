import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Fragments/Mobile_Fragments/edit_todo_mobile_fragment.dart';
import 'package:todo_list_app/Fragments/WideScreen_Fragments/edit_todo_wide_fragment.dart';
import 'package:todo_list_app/Model/todo_model.dart';

class EditTodoScreen extends StatelessWidget {
  final Todo todo;

  const EditTodoScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final edittodocontroller = Get.find<TodoController>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final isMobileNow = constraints.maxWidth < 600;
            if (edittodocontroller.isMobile.value != isMobileNow) {
              edittodocontroller.isMobile.value = isMobileNow;
            }
          });

          return Obx(
            () => edittodocontroller.isMobile.value
                ? EditTodoMobile(todo: todo)
                : EditTodoWide(todo: todo),
          );
        },
      ),
    );
  }
}
