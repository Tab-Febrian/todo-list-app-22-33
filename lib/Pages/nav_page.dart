import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/nav_controller.dart';
import 'package:todo_list_app/Pages/history_screen.dart';
import 'package:todo_list_app/Pages/profile_screen.dart';
import 'package:todo_list_app/Pages/todo_screen.dart';

class NavPage extends StatelessWidget {
  final navController = Get.find<NavController>();

  final List<Widget> pages = [
    TodoScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[navController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changePage,
          selectedItemColor: Colors.teal, 
          unselectedItemColor: Colors.grey, 
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_task),
              label: 'Todo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
