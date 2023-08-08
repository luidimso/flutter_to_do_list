import 'package:flutter/material.dart';

class Checklist extends StatelessWidget {
  const Checklist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: "E-mail",
              hintText: "exemple@email.com",
            ),
          ),
        ),
      )
    );
  }
}