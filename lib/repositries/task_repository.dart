import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';

const key = "task_list";

class TaskRepository {
  late SharedPreferences sharedPreferences;

  void save(List<Task> tasks) async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = json.encode(tasks);
    sharedPreferences.setString(key, jsonString);
  }

  Future<List<Task>> get() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(key) ?? "[]";
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Task.fromJson(e)).toList();
  }
}