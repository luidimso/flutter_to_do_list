import 'package:shared_preferences/shared_preferences.dart';

class TaskRepository {
  TaskRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  late SharedPreferences sharedPreferences;

  
}