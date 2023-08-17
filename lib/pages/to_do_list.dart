import 'package:checklist/models/task.dart';
import 'package:checklist/repositries/task_repository.dart';
import 'package:checklist/widgets/to_do_list_item.dart';
import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  final TextEditingController tasksInputController = TextEditingController();
  final TaskRepository taskRepository = TaskRepository();

  List<Task> tasks = [];
  Task? deletedTask;
  int? deletedTaskPosition;
  String? errorText;

  @override
  void initState() {
    super.initState();
    update();
  }

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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Add a task",
                          hintText: "Study",
                          errorText: errorText,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2
                            )
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.green
                          )
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

                          if(text.isEmpty) {
                            setState(() {
                              errorText = "You cannot insert an empty task";
                            });
                            return;
                          }

                          setState(() {
                            String text = tasksInputController.text;
                            setState(() {
                              Task newTask = Task(
                                title: text,
                                dateTime: DateTime.now()
                              );
                              tasks.add(newTask);
                              errorText = null;
                            });
                            tasksInputController.clear();
                            taskRepository.save(tasks);
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
                      onPressed: deleteAllTasks,
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
        taskRepository.save(tasks);
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
                  taskRepository.save(tasks);
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


  void deleteAllTasks() {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Clear all?"),
      content: const Text("Are you sure that you want to clear all the tasks?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.lightBlue
          ),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            deleteAll();
          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.red
          ),
          child: const Text("Clear all"),
        )
      ],
    ));
  }


  void deleteAll() {
    setState(() {
      tasks.clear();
      taskRepository.save(tasks);
    });
  }

  void update() async {
    setState(() async {
      tasks = await taskRepository.get();
    });
  }
}