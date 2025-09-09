import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Model/todo_model.dart';
import 'package:todo_list_app/Routes/routes.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String title, String description, String category) {
    if (title.isEmpty || description.isEmpty) {
      Get.snackbar(
        'Gagal',
        'Judul dan deskripsi tidak boleh kosong',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
      return;
    }

    todos.add(Todo(
      title: title,
      description: description,
      category: category,
    ));
    todos.refresh();

    Get.offAllNamed(AppRoutes.nav);

    Get.snackbar(
      'Berhasil',
      'Todo berhasil ditambahkan',
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color.fromARGB(255, 28, 88, 30),
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }

  void toggleDone(int index) {
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
    Get.snackbar(
      'Berhasil Menghapus',
      'Todo berhasil dihapus',
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }

  List<Todo> get completedTodos => todos.where((todo) => todo.isDone).toList();
}
