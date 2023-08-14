import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoListItem extends StatelessWidget {
  const ToDoListItem({super.key, required this.title});

  final String title;

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
            Text("2023-8-11", style: const TextStyle(
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

