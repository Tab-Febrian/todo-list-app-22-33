import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool isDone;
  final VoidCallback? onToggle;
  final VoidCallback? onDelete;
  final bool showActions;

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    this.onToggle,
    this.onDelete,
    this.showActions = true,
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
        subtitle: Text("$description $category"),
        trailing: showActions
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: isDone,
                    onChanged: (_) => onToggle?.call(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: onDelete,
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
