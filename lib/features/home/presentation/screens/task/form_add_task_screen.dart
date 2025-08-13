import 'package:flutter/material.dart';

class FormAddTaskScreen extends StatelessWidget {
  const FormAddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agregar tarea"), centerTitle: true,),
      body: const FormAddTaskView(),
    );
  }
}

class FormAddTaskView extends StatelessWidget {
  const FormAddTaskView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}