import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/nav_controller.dart';
import 'package:todo_list_app/Fragments/history_fragment.dart';
import 'package:todo_list_app/Fragments/profile_fragment.dart';
import 'package:todo_list_app/Fragments/todo_fragment.dart';

class NavPage extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  final List<Widget> pages = [
    TodoFragment(),
    HistoryFragment(),
    ProfileFragment()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[navController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add_task),label: 'Todo'),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
