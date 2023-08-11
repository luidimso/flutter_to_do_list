import 'package:flutter/material.dart';

class Checklist extends StatelessWidget {
  Checklist({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Add a task",
                    hintText: "Study"
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(14)
                  ),
                  child: const Icon(Icons.add, size: 30,),
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