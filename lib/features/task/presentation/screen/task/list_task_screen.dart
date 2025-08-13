import 'package:flutter/material.dart';
import 'package:flutter_tasks_md/core/core.dart';
import 'package:flutter_tasks_md/features/task/presentation/view/list_task_view.dart';
import 'package:go_router/go_router.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){ 
          context.go(RoutePaths.formularioAddTask);
          },
          child: const Icon(Icons.format_list_bulleted_add),
          ),

      appBar: AppBar(
        title: const Text("Task List"),
        centerTitle: true,
      ),
      
      body: const ListTaskView(),
    );
  }
}
