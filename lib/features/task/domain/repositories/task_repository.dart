import 'package:flutter_tasks_md/features/features.dart';

abstract class TaskRepository {

  Future<void> saveTasks(List<TaskEntity> tasks);

  List<TaskEntity> loadTasks();

}