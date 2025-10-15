import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Widgets/todo_card.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';

class HistoryWide extends StatelessWidget {
  HistoryWide({super.key});
  final todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History (Wide)",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        if (todoController.completedTodos.isEmpty) {
          return const Center(
            child: ReusableText(
              text: "Belum ada todo yang selesai!",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            itemCount: todoController.completedTodos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final todo = todoController.completedTodos[index];
              return TodoCard(
                title: todo.title,
                description: todo.description,
                category: todo.category,
                isDone: true,
                startTime: todo.startTime,
                endTime: todo.endTime,
                onToggle: () => todoController.revertTodo(context, index),
                trailingWidget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.blue),
                      onPressed: () => todoController.revertTodo(context, index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => todoController.deleteHistoryTodo(context, index),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
