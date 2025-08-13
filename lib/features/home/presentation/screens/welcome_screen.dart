import 'package:flutter/material.dart';
import 'package:flutter_tasks_md/config/router/route_paths.dart';
import 'package:go_router/go_router.dart';
import '../../data/repositories/welcome_repository_impl.dart';
import '../../domain/usecases/get_welcome_message.dart';
import '../controllers/welcome_controller.dart';

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
      floatingActionButton: FloatingActionButton(onPressed: (){ context.go(RoutePaths.formularioAddTask);}, child: Icon(Icons.format_list_bulleted_add),),
      appBar: AppBar(title: const Text('Bienvenido')),
      body: Center(
        child: Text(message), //todo cambia el mensaje: ¡Bienvenido a FlutterTasks! by <<tu nombre>>
      ),
    );
  }
}
