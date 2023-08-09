import 'package:flutter/material.dart';

class Checklist extends StatelessWidget {
  Checklist({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  hintText: "exemple@email.com",
                ),
                controller: emailController,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
              ),
              ElevatedButton(
                  onPressed: login,
                  child: const Text("Login")
              )
            ],
          ),
        ),
      )
    );
  }


  void login() {
    String text = emailController.text;
    print(text);
    emailController.clear();
  }

  void onChanged(String text) {
    print(text);
  }

  void onSubmitted(String text) {
    print(text);
  }
}