import '../repositories/task_repository.dart';

class ToggleTaskCompletion {
  final TaskRepository repository;

  ToggleTaskCompletion(this.repository);

  Future<void> call(String id) async {
    await repository.toggleTaskCompletion(id);
  }
}