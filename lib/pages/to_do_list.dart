import 'package:checklist/widgets/to_do_list_item.dart';
import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  Checklist({super.key});

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  final TextEditingController tasksInputController = TextEditingController();

  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Add a task",
                        hintText: "Study"
                      ),
                      controller: tasksInputController,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String text = tasksInputController.text;
                        setState(() {
                          String text = tasksInputController.text;
                          setState(() {
                            tasks.add(text);
                            tasksInputController.clear();
                          });
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.all(14)
                      ),
                      child: const Icon(Icons.add, size: 30,),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for(String task in tasks)
                    ToDoListItem()
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text("You have 0 tasks to do")
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.all(14)
                    ),
                    child: const Text("Clear all"),
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }

  void login() {

  }
}