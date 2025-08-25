import 'package:flutter/material.dart';
import '../../data/repositories/welcome_repository_impl.dart';
import '../../domain/usecases/get_welcome_message.dart';
import '../controllers/welcome_controller.dart';
import '../../../tasks/presentation/screens/task_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String message = 'Cargando...';

  late final WelcomeController controller;

  @override
  void initState() {
    super.initState();
    controller = WelcomeController(
      GetWelcomeMessage(WelcomeRepositoryImpl()),
    );
    loadMessage();
  }

  Future<void> loadMessage() async {
    final welcome = await controller.fetchMessage();
    setState(() {
      message = welcome.message;
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterTasks'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TasksScreen(),
                  ),
                );
              },
              child: const Text('Ver Tareas'),
            ),
          ],
        ),
      ),
    );
  }
}
