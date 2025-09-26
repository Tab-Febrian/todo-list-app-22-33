import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/todo_controller.dart';
import 'package:todo_list_app/Widgets/reusable_text.dart';
import 'package:todo_list_app/Widgets/reusable_textfield.dart';
import 'package:todo_list_app/Widgets/reusable_button.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  final List<String> _categories = ["Sekolah", "Pekerjaan", "Pribadi"];
  final RxString _selectedCategory = "Sekolah".obs;

  AddTodoPage({super.key});

  Future<void> _pickTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

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
          "Add To Do",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          margin: const EdgeInsets.only(top: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableTextField(
                  controller: _titleController,
                  label: "Judul",
                ),
                const SizedBox(height: 16),
                ReusableTextField(
                  controller: _descController,
                  label: "Deskripsi",
                ),
                const SizedBox(height: 16),
                const ReusableText(
                  text: "Kategori",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                      color: Colors.white,
                    ),
                    child: DropdownButton<String>(
                      value: _selectedCategory.value,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: _categories
                          .map(
                            (cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(cat),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        if (val != null) _selectedCategory.value = val;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ReusableTextField(
                  controller: _startTimeController,
                  label: "Waktu Mulai",
                  readOnly: true,
                  onTap: () => _pickTime(context, _startTimeController),
                ),
                const SizedBox(height: 16),
                ReusableTextField(
                  controller: _endTimeController,
                  label: "Waktu Selesai",
                  readOnly: true,
                  onTap: () => _pickTime(context, _endTimeController),
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
                        _titleController.text,
                        _descController.text,
                        _selectedCategory.value,
                        _startTimeController.text,
                        _endTimeController.text,
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
