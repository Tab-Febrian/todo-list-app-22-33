import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';
import 'package:todo_list_app/Widgets/reusable_textfield.dart';
import 'package:todo_list_app/Widgets/reusable_button.dart';

class AddTodoMobile extends StatelessWidget {
  AddTodoMobile({super.key});

  Future<void> _pickTime(BuildContext context, TextEditingController controller) async {
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

    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text(
          "Tambah To-Do (Mobile)",
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
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          margin: const EdgeInsets.only(top: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: todoController.selectedCategory.value,
                    items: ["Sekolah", "Pekerjaan", "Pribadi"]
                        .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                        .toList(),
                    onChanged: (val) =>
                        todoController.selectedCategory.value = val ?? "Sekolah",
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
                    text: "Simpan",
                    color: Colors.teal,
                    onPressed: () {
                      todoController.addTodo(
                        context,
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
