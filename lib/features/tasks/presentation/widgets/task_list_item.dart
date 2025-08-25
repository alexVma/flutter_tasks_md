import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../controllers/task_controller.dart';

class TaskListItem extends ConsumerWidget {
  final Task task;

  const TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchar los cambios del estado de tareas para obtener la tarea actualizada
    final tasksAsync = ref.watch(taskControllerProvider);
    
    return tasksAsync.when(
      data: (tasks) {
        // Buscar la tarea actualizada en la lista
        final updatedTask = tasks.firstWhere(
          (t) => t.id == task.id,
          orElse: () => task,
        );
        
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            leading: Checkbox(
              value: updatedTask.isCompleted,
              onChanged: (value) {
                ref.read(taskControllerProvider.notifier).toggleTaskCompletion(updatedTask.id);
              },
            ),
            title: Text(
              updatedTask.title,
              style: TextStyle(
                decoration: updatedTask.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: updatedTask.description != null
                ? Text(
                    updatedTask.description!,
                    style: TextStyle(
                      decoration: updatedTask.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  )
                : null,
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirmar eliminación'),
                    content: Text('¿Estás seguro de que quieres eliminar la tarea "${updatedTask.title}"?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          ref.read(taskControllerProvider.notifier).deleteTask(updatedTask.id);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        child: const Text('Eliminar'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Eliminar tarea',
            ),
          ),
        );
      },
      loading: () => Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (value) {
              ref.read(taskControllerProvider.notifier).toggleTaskCompletion(task.id);
            },
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: task.description != null
              ? Text(
                  task.description!,
                  style: TextStyle(
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                )
              : null,
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmar eliminación'),
                  content: Text('¿Estás seguro de que quieres eliminar la tarea "${task.title}"?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ref.read(taskControllerProvider.notifier).deleteTask(task.id);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      child: const Text('Eliminar'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete, color: Colors.red),
            tooltip: 'Eliminar tarea',
          ),
        ),
      ),
      error: (error, stack) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (value) {
              ref.read(taskControllerProvider.notifier).toggleTaskCompletion(task.id);
            },
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: task.description != null
              ? Text(
                  task.description!,
                  style: TextStyle(
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                )
              : null,
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmar eliminación'),
                  content: Text('¿Estás seguro de que quieres eliminar la tarea "${task.title}"?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ref.read(taskControllerProvider.notifier).deleteTask(task.id);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      child: const Text('Eliminar'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete, color: Colors.red),
            tooltip: 'Eliminar tarea',
          ),
        ),
      ),
    );
  }
}