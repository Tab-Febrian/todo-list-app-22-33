import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Routes/routes.dart';
import 'package:todo_list_app/Widgets/todo_card.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';

class TodoFragment extends StatelessWidget {
  TodoFragment({super.key});
  final todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ReusableText(
          text: "Todo List",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(
            child: ReusableText(
              text: "Belum ada todo!",
              style: TextStyle(fontSize: 15, color: Colors.grey),
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
              startTime: todo.startTime,
              endTime: todo.endTime,
              trailingWidget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      Get.toNamed(AppRoutes.todoEdit, arguments: todo);
                    },
                  ),
                  Checkbox(
                    value: todo.isDone,
                    activeColor: Colors.teal,
                    onChanged: (value) {
                      if (value == true) {
                        todoController.toggleDone(context, index);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => Get.toNamed(AppRoutes.todoAdd),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
