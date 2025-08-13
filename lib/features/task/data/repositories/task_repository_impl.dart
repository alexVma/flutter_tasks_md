import 'dart:convert';

import 'package:flutter_tasks_md/core/core.dart';
import 'package:flutter_tasks_md/features/task/task.dart';

class TaskRepositoryImpl extends TaskRepository{

final SharedPreferenceStorage prefs;

  static const String tasksKey = "tasks";

  TaskRepositoryImpl(this.prefs);

  @override
  Future<void> saveTasks(List<TaskEntity> tasks) async {
    final jsonList = tasks.map((t) => t.toJson()).toList();
    await prefs.setString(tasksKey, jsonEncode(jsonList));
  }

  @override
  List<TaskEntity> loadTasks() {
    final jsonStr = prefs.getString(tasksKey);
    if (jsonStr == null) return [];
    final List decoded = jsonDecode(jsonStr);
    return decoded.map((e) => TaskEntity.fromJson(e)).toList();
  }
  
  }
  
