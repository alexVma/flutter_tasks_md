import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tasks_md/core/core.dart';
import 'package:flutter_tasks_md/features/task/presentation/providers/task_provider.dart';
import 'package:go_router/go_router.dart';

class ListTaskView extends ConsumerWidget {
  const ListTaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    final taskNotifier = ref.read(taskListProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text('No hay tareas'))
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];

                      return Dismissible(
                        key: ValueKey(task.title + task.description),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) async {
                          final newList = [...tasks]..removeAt(index);
                          await taskNotifier.updateTaskList(newList);
                        },
                        child: ListTile(
                          title: Text(task.title),
                          subtitle: Text(task.description),
                          leading: Checkbox(
                            value: task.isDone,
                            onChanged: (value) async {
                              final updatedTask =
                                  task.copyWith(isDone: value ?? false);
                              final newList = [...tasks];
                              newList[index] = updatedTask;
                              await taskNotifier.updateTaskList(newList);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),

          const SizedBox(height: 10),

          FilledButton(
            onPressed: () {
              context.go(RoutePaths.main);
            },
            child: const Text('Back to Menu'),
          ),
        ],
      ),
    );
  }
}
