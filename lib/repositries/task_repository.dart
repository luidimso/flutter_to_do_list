import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';

class TaskRepository {
  TaskRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  late SharedPreferences sharedPreferences;

  void save(List<Task> tasks) {
    final String jsonString = json.encode(tasks);
    sharedPreferences.setString("task_list", jsonString);
  }
}