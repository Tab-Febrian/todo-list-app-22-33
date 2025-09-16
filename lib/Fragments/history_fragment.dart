import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Widgets/todo_card.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';

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
        return ListView.builder(
          itemCount: todoController.completedTodos.length,
          itemBuilder: (context, index) {
            final todo = todoController.completedTodos[index];
            return TodoCard(
              title: todo.title,
              description: todo.description,
              category: todo.category,
              isDone: true,
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
                    onPressed: () =>
                        todoController.deleteHistoryTodo(context, index),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
