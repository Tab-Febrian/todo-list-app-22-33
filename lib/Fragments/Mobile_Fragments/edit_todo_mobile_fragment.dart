import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Model/todo_model.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';
import 'package:todo_list_app/Widgets/reusable_textfield.dart';
import 'package:todo_list_app/Widgets/reusable_button.dart';

class EditTodoMobile extends StatelessWidget {
  final Todo todo;
  EditTodoMobile({super.key, required this.todo});

  final List<String> _categories = ["Sekolah", "Pekerjaan", "Pribadi"];

  Future<void> _pickTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      controller.text = picked.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();
    todoController.titleController.text = todo.title;
    todoController.descController.text = todo.description;
    todoController.startTimeController.text = todo.startTime ?? "";
    todoController.endTimeController.text = todo.endTime ?? "";
    todoController.selectedCategory.value = todo.category;

    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: const Text(
          "Edit Todo (Mobile)",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          margin: const EdgeInsets.only(top: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ReusableTextField(
                  controller: todoController.titleController,
                  label: "Judul",
                ),
                const SizedBox(height: 16),
                ReusableTextField(
                  controller: todoController.descController,
                  label: "Deskripsi",
                ),
                const SizedBox(height: 16),
                const ReusableText(
                  text: "Kategori",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: todoController.selectedCategory.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: _categories
                        .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) {
                        todoController.selectedCategory.value = val;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                ReusableTextField(
                  controller: todoController.startTimeController,
                  label: "Waktu Mulai",
                  readOnly: true,
                  onTap: () => _pickTime(context, todoController.startTimeController),
                ),
                const SizedBox(height: 16),
                ReusableTextField(
                  controller: todoController.endTimeController,
                  label: "Waktu Selesai",
                  readOnly: true,
                  onTap: () => _pickTime(context, todoController.endTimeController),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ReusableButton(
                    text: "Update",
                    color: Colors.teal,
                    onPressed: () {
                      todoController.editTodo(
                        context,
                        todoController.todos.indexWhere((t) => t.id == todo.id),
                        todoController.titleController.text,
                        todoController.descController.text,
                        todoController.selectedCategory.value,
                        todoController.startTimeController.text,
                        todoController.endTimeController.text,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
