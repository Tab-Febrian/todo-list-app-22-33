import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Routes/routes.dart';
import 'package:todo_list_app/Widgets/todo_card.dart';

class TodoFragment extends StatelessWidget {
  const TodoFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo List",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada todo",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return TodoCard(
              title: todo.title,
              description: todo.description,
              category: todo.category,
              isDone: todo.isDone,
              onToggle: () => todoController.toggleDone(index),
              onDelete: () => todoController.deleteTodo(index),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () =>  Get.toNamed(AppRoutes.todoAdd),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
