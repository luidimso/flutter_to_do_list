import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoListItem extends StatelessWidget {
  const ToDoListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("2023-8-11", style: TextStyle(
            fontSize: 12,
        ),),
            Text("Task 1", style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}

