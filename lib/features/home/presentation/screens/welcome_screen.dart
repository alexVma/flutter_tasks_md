import 'package:flutter/material.dart';
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
      appBar: AppBar(title: const Text('Bienvenido')),
      body: Center(
        child: Text(message), //todo cambia el mensaje: ¡Bienvenido a FlutterTasks! by <<tu nombre>>
      ),
    );
  }
}
