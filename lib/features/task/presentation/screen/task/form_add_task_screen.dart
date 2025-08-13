import 'package:flutter/material.dart';
import 'package:flutter_tasks_md/features/task/presentation/view/form_add_task_view.dart';


class FormAddTaskScreen extends StatelessWidget {
  const FormAddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("add a task"), 
        centerTitle: true,),
      body: const FormAddTaskView(),
    );
  }
}
