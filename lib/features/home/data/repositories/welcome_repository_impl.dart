import '../../domain/entities/welcome_message.dart';
import '../../domain/repositories/welcome_repository.dart';

class WelcomeRepositoryImpl implements WelcomeRepository {
  @override
  Future<WelcomeMessage> getWelcomeMessage() async {
    //await Future.delayed(const Duration(milliseconds: 000));
    return WelcomeMessage('¡Bienvenido a FlutterTasks!');
  }
}
