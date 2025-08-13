import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tasks_md/features/features.dart';
import 'package:shared_preferences/shared_preferences.dart';

final taskListProvider = StateNotifierProvider<TaskNotifier, List<TaskEntity>>((ref) => TaskNotifier());


class TaskNotifier extends StateNotifier<List<TaskEntity>> {

  TaskNotifier() : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('tasks') ?? [];
    state = saved
        .map((e) => TaskEntity.fromJson(jsonDecode(e) as Map<String, dynamic>))
        .toList();
  }


  Future<void> addTaskFromForm(TaskFormState form) async {
    final prefs = await SharedPreferences.getInstance();

    final newTask = TaskEntity(
      title: form.title.value,
      description: form.description.value,
      isDone: form.isImportant.value,
    );

    state = [...state, newTask];

    final jsonList = state.map((t) => jsonEncode(t.toJson())).toList();
    await prefs.setStringList('tasks', jsonList);
  }


  Future<void> updateTaskList(List<TaskEntity> newList) async {
  final prefs = await SharedPreferences.getInstance();
  state = newList;
  final jsonList = state.map((t) => jsonEncode(t.toJson())).toList();
  await prefs.setStringList('tasks', jsonList);
}

}


