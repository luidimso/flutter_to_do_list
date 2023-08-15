import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class ToDoListItem extends StatelessWidget {
  const ToDoListItem({super.key, required this.title, required this.dateTime, required this.onDelete});

  final String title;
  final DateTime dateTime;
  final Function(String) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2
      ),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (teste) {
                  onDelete(title);
                },
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: "Delete",
              )
            ]
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(DateFormat("dd/MMM/yyyy - HH:mm").format(dateTime), style: const TextStyle(
                fontSize: 12,
            ),),
                Text(title, style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

