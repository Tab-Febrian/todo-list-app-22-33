import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Model/todo_model.dart';
import 'package:todo_list_app/Routes/routes.dart';
import 'package:todo_list_app/Widgets/reusable_dialog.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var completedTodos = <Todo>[].obs;

  void revertTodo(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          title: "Konfirmasi Kembalikan",
          content: const ReusableText(
            text: "Anda yakin ingin mengembalikan to-do ini ke Todo List?",
          ),
          onConfirm: () {
            final todoToRevert = completedTodos.removeAt(index);
            todoToRevert.isDone = false;
            todos.add(todoToRevert);
            todos.refresh();
            completedTodos.refresh();
            Get.snackbar(
              'Berhasil Mengembalikan',
              'To-do berhasil dikembalikan ke Todo List',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.blue,
              colorText: Colors.white,
              margin: const EdgeInsets.all(10),
            );
          },
        );
      },
    );
  }

  void addTodo(BuildContext context, String title, String description, String category) {
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

  showDialog(
    context: context,
    builder: (context) {
      return ReusableDialog(
        title: "Konfirmasi Tambah",
        content: const ReusableText(
          text: "Apakah Anda yakin ingin menambahkan to-do ini?",
        ),
        onConfirm: () {
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
        },
      );
    },
  );
}

  void toggleDone(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (context) {
      return ReusableDialog(
        title: "Konfirmasi Selesai",
        content: const ReusableText(
          text: "Apakah Anda yakin ingin memindahkan to-do ini ke History?",
        ),
        onConfirm: () {
          final todoToMove = todos.removeAt(index);
          todoToMove.isDone = true;
          completedTodos.add(todoToMove);

          todos.refresh();
          completedTodos.refresh();

          Get.snackbar(
            'Selesai!',
            'Todo berhasil diselesaikan dan dipindahkan ke History',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
          );
        },
      );
    },
  );
}


  void deleteHistoryTodo(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          title: "Konfirmasi Hapus",
          content: const ReusableText(
            text: "Anda yakin ingin menghapus to-do ini dari history?",
          ),
          onConfirm: () {
            completedTodos.removeAt(index);
            Get.snackbar(
              'Berhasil Menghapus',
              'Todo berhasil dihapus dari history',
              snackPosition: SnackPosition.TOP,
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
              colorText: Colors.white,
              margin: const EdgeInsets.all(10),
            );
            completedTodos.refresh();
          },
        );
      },
    );
  }
}
