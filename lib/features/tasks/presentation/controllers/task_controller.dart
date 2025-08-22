import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/get_all_tasks.dart';
import '../../domain/usecases/toggle_task_completition.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../domain/repositories/task_repository.dart';


part 'task_controller.g.dart';

@riverpod
class TaskController extends _$TaskController {
  @override
  Future<List<Task>> build() async {
    final getAllTasks = ref.read(getAllTasksProvider);
    return await getAllTasks();
  }

  Future<void> addTask(String title, String? description, {bool isCompleted = false}) async {
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      isCompleted: isCompleted,
    );

    final addTaskUseCase = ref.read(addTaskProvider);
    await addTaskUseCase(task);
    
    ref.invalidateSelf();
  }

  Future<void> toggleTaskCompletion(String id) async {
    final toggleUseCase = ref.read(toggleTaskCompletionProvider);
    await toggleUseCase(id);
    
    ref.invalidateSelf();
  }

  Future<void> deleteTask(String id) async {
    final repository = ref.read(taskRepositoryProvider);
    await repository.deleteTask(id);
    
    ref.invalidateSelf();
  }
}

@riverpod
GetAllTasks getAllTasks(GetAllTasksRef ref) {
  return GetAllTasks(ref.read(taskRepositoryProvider));
}

@riverpod
AddTask addTask(AddTaskRef ref) {
  return AddTask(ref.read(taskRepositoryProvider));
}

@riverpod
ToggleTaskCompletion toggleTaskCompletion(ToggleTaskCompletionRef ref) {
  return ToggleTaskCompletion(ref.read(taskRepositoryProvider));
}

@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
  return TaskRepositoryImpl();
}