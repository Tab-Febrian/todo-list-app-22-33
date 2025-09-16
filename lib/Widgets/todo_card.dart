import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool isDone;
  final VoidCallback? onToggle;
  final VoidCallback? onDelete;
  final Widget? trailingWidget; 

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    this.onToggle,
    this.onDelete,
    this.trailingWidget, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
            color: isDone ? Colors.grey : Colors.black,
          ),
        ),
        subtitle: Text("$description — $category"),
        trailing: trailingWidget, 
      ),
    );
  }
}