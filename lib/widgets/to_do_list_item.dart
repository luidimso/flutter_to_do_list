import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoListItem extends StatelessWidget {
  const ToDoListItem({super.key, required this.title, required this.dateTime});

  final String title;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 2
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}

