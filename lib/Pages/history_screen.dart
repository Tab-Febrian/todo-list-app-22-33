import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Fragments/Mobile_Fragments/history_mobile_fragment.dart';
import 'package:todo_list_app/Fragments/WideScreen_Fragments/history_wide_fragment.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final historycontroller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          historycontroller.updateLayout(constraints);
          return Obx(
            () => historycontroller.isMobile.value
                ? HistoryMobile()
                : HistoryWide(),
          );
        },
      ),
    );
  }
}