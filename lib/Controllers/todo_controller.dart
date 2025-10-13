import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Database/db_helper.dart';
import 'package:todo_list_app/Model/todo_model.dart';
import 'package:todo_list_app/Routes/routes.dart';
import 'package:todo_list_app/Widgets/reusable_dialog.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';

class TodoController extends GetxController {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final selectedCategory = "Sekolah".obs;

  var todos = <Todo>[].obs;
  var completedTodos = <Todo>[].obs;
  final DBHelper _dbHelper = DBHelper();

  var isMobile = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final allTodos = await _dbHelper.getTodos();
    todos.value = allTodos.where((t) => !t.isDone).toList();
    completedTodos.value = allTodos.where((t) => t.isDone).toList();
  }

  void addTodo(
    BuildContext context,
    String title,
    String description,
    String category,
    String? startTime,
    String? endTime,
  ) {
    if (title.isEmpty ||
        description.isEmpty ||
        startTime == null ||
        endTime == null) {
      Get.snackbar(
        'Gagal',
        'Semua field wajib diisi',
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
          onConfirm: () async {
            final newTodo = Todo(
              title: title,
              description: description,
              category: category,
              startTime: startTime,
              endTime: endTime,
            );

            await _dbHelper.insertTodo(newTodo);
            await loadTodos();

            clearForm();

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
          onConfirm: () async {
            final todo = todos.removeAt(index);
            todo.isDone = true;

            await _dbHelper.updateTodoDoneStatus(todo.id!, true);
            completedTodos.add(todo);

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

  void editTodo(
    BuildContext context,
    int index,
    String newTitle,
    String newDescription,
    String newCategory,
    String? newStartTime,
    String? newEndTime,
  ) {
    if (index < 0 || index >= todos.length) return;
    if (newTitle.isEmpty ||
        newDescription.isEmpty ||
        newStartTime == null ||
        newEndTime == null) {
      Get.snackbar(
        'Gagal',
        'Semua field harus diisi',
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
          title: "Konfirmasi Update",
          content: const ReusableText(
            text: "Apakah Anda yakin ingin mengubah to-do ini?",
          ),
          onConfirm: () async {
            final todo = todos[index];
            final updatedTodo = Todo(
              id: todo.id,
              title: newTitle,
              description: newDescription,
              category: newCategory,
              startTime: newStartTime,
              endTime: newEndTime,
              isDone: todo.isDone,
            );

            await _dbHelper.updateTodo(updatedTodo);
            await loadTodos();

            clearForm();

            Get.back();
            Get.snackbar(
              'Berhasil',
              'Todo berhasil diupdate',
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

  void revertTodo(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          title: "Konfirmasi Kembalikan",
          content: const ReusableText(
            text: "Anda yakin ingin mengembalikan to-do ini ke Todo List?",
          ),
          onConfirm: () async {
            final todo = completedTodos.removeAt(index);
            todo.isDone = false;

            await _dbHelper.updateTodoDoneStatus(todo.id!, false);
            todos.add(todo);

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

  void deleteHistoryTodo(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          title: "Konfirmasi Hapus",
          content: const ReusableText(
            text: "Anda yakin ingin menghapus to-do ini dari history?",
          ),
          onConfirm: () async {
            final todo = completedTodos.removeAt(index);
            if (todo.id != null) {
              await _dbHelper.deleteTodo(todo.id!);
            }

            completedTodos.refresh();

            Get.snackbar(
              'Berhasil Menghapus',
              'Todo berhasil dihapus dari history',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              margin: const EdgeInsets.all(10),
            );
          },
        );
      },
    );
  }

  void clearForm() {
    titleController.clear();
    descController.clear();
    startTimeController.clear();
    endTimeController.clear();
    selectedCategory.value = "Sekolah";
  }

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
