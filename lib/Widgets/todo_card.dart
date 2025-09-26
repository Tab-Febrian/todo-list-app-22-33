import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool isDone;
  final String? startTime;
  final String? endTime;
  final VoidCallback? onToggle;
  final VoidCallback? onDelete;
  final Widget? trailingWidget;

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    this.startTime,
    this.endTime,
    this.onToggle,
    this.onDelete,
    this.trailingWidget,
  });

  Color _getCategoryColor(String category) {
    switch (category) {
      case "Sekolah":
        return Colors.blue;
      case "Pekerjaan":
        return Colors.teal;
      case "Pribadi":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: _getCategoryColor(category),
              width: 6,
            ),
          ),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: isDone ? TextDecoration.lineThrough : null,
              color: isDone ? Colors.grey : Colors.black87,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$description — $category",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                if (startTime != null && endTime != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    "$startTime - $endTime",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
          trailing: trailingWidget,
        ),
      ),
    );
  }
}
