import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';
import 'package:todo_list_app/Widgets/reusable_textfield.dart';
import 'package:todo_list_app/Widgets/reusable_button.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final List<String> _categories = ["Sekolah", "Pekerjaan", "Pribadi"];
  final RxString _selectedCategory = "Sekolah".obs;

  AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add To Do",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableTextField(controller: _titleController, label: "Judul"),
            const SizedBox(height: 12),
            ReusableTextField(controller: _descController, label: "Deskripsi"),
            const SizedBox(height: 12),
            const ReusableText(
              text: "Kategori",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Obx(
              () => DropdownButton<String>(
                value: _selectedCategory.value,
                isExpanded: true,
                items: _categories
                    .map(
                      (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                    )
                    .toList(),
                onChanged: (val) {
                  if (val != null) _selectedCategory.value = val;
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ReusableButton(
                text: "Simpan",
                color: Colors.teal,
                onPressed: () {
                  todoController.addTodo(
                    _titleController.text,
                    _descController.text,
                    _selectedCategory.value,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
