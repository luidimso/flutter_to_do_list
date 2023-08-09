import 'package:flutter/material.dart';

class Checklist extends StatelessWidget {
  Checklist({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Add a task",
                    hintText: "Study"
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  onPressed: null,
                  child: Text("+")
              )
            ],
          ),
        )
      )
    );
  }


  void login() {
    String text = emailController.text;
    print(text);
    emailController.clear();
  }
}