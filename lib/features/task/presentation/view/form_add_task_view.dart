import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tasks_md/core/core.dart';
import 'package:flutter_tasks_md/features/features.dart';
import 'package:flutter_tasks_md/features/task/presentation/providers/task_provider.dart';
import 'package:go_router/go_router.dart';


class FormAddTaskView extends ConsumerWidget {
  const FormAddTaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(taskFormProvider);
    final formNotifier = ref.read(taskFormProvider.notifier);

    return  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Campo Título
            TextField(
              decoration: InputDecoration(
                labelText: 'Título',
                errorText: formState.title.isNotValid ? 'Campo obligatorio' : null,
                border: const OutlineInputBorder(),
              ),
              onChanged: formNotifier.onTitleChanged,
            ),
            const SizedBox(height: 12),

            // Campo Descripción
            TextField(
              decoration: InputDecoration(
                labelText: 'Descripción',
                errorText:
                    formState.description.isNotValid ? 'Campo obligatorio' : null,
                border: const OutlineInputBorder(),
              ),
              onChanged: formNotifier.onDescriptionChanged,
            ),
            const SizedBox(height: 12),

            // Checkbox
            Row(
              children: [
                Checkbox(
                  value: formState.isImportant.value,
                  onChanged: (value) {
                    formNotifier.onIsDone(value ?? false);
                  },
                ),
                const Text('¿Completada?'),
              ],
            ),
            const SizedBox(height: 20),

            // Botón Guardar
            FilledButton(
              onPressed: formState.status
                  ? () {
                      // Agregar la task al provider principal
                      ref.read(taskListProvider.notifier).addTaskFromForm(formState);

                      // Navegar
                      context.go(RoutePaths.checkAllTask);
                    }
                  : null,
              child: const Text('Guardar'),
            ),

            const SizedBox(height: 8),

            // Botón volver
            FilledButton(
              onPressed: () => context.go(RoutePaths.main),
              child: const Text('Volver al menú'),
            ),
          ],
        ),
    );
  }
}
