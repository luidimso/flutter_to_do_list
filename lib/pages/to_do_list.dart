import 'package:checklist/models/task.dart';
import 'package:checklist/widgets/to_do_list_item.dart';
import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  Checklist({super.key});

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  final TextEditingController tasksInputController = TextEditingController();

  List<Task> tasks = [];
  Task? deletedTask;
  int? deletedTaskPosition;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                              Task newTask = Task(
                                title: text,
                                dateTime: DateTime.now()
                              );
                              tasks.add(newTask);
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
                      for(Task task in tasks)
                      ToDoListItem(
                        title: task.title,
                        dateTime: task.dateTime,
                        onDelete: onDelete
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text("You have ${tasks.length} tasks to do")
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
      ),
    );
  }

  void onDelete(String title) {
    Task taskToRemove = Task(
      title: "",
      dateTime: DateTime.now()
    );

    for(Task task in tasks) {
      if(task.title == title) {
        taskToRemove = task;
        deletedTask = task;
        deletedTaskPosition = tasks.indexOf(task);
      }
    }

    if(taskToRemove != null) {
      setState(() {
        tasks.remove(taskToRemove);
      });

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Task ${taskToRemove.title} was removed successfully",
            style: const TextStyle(
              color: Colors.blueGrey
            ),),
            backgroundColor: Colors.white,
            action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                setState(() {
                  tasks.insert(deletedTaskPosition!, deletedTask!);
                });
              },
              textColor: Colors.lightBlueAccent,
            ),
            duration: const Duration(
              seconds: 5
            ),
          )
      );
    }
  }
}