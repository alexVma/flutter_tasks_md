import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  static const String _boxName = 'tasks';

  @override
  Future<List<Task>> getAllTasks() async {
    final box = await Hive.openBox<Task>(_boxName);
    final tasks = box.values.toList();
    // Sin ordenamiento por fecha
    return tasks;
  }

  @override
  Future<void> addTask(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    await box.add(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    final index = box.values.toList().indexWhere((t) => t.id == task.id);
    if (index != -1) {
      await box.putAt(index, task);
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    final box = await Hive.openBox<Task>(_boxName);
    final index = box.values.toList().indexWhere((t) => t.id == id);
    if (index != -1) {
      await box.deleteAt(index);
    }
  }

  @override
  Future<void> toggleTaskCompletion(String id) async {
    final box = await Hive.openBox<Task>(_boxName);
    final index = box.values.toList().indexWhere((t) => t.id == id);
    if (index != -1) {
      final task = box.getAt(index)!;
      final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
      await box.putAt(index, updatedTask);
    }
  }
}