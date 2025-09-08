import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Widgets/todo_card.dart';

class HistoryFragment extends StatelessWidget {
  const HistoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        final completed = todoController.completedTodos;
        if (completed.isEmpty) {
          return const Center(child: Text("Belum ada todo yang selesai"));
        }
        return ListView.builder(
          itemCount: completed.length,
          itemBuilder: (context, index) {
            final todo = completed[index];
            return TodoCard(
              title: todo.title,
              description: todo.description,
              category: todo.category,
              isDone: true,
              showActions: false,
            );
          },
        );
      }),
    );
  }
}
