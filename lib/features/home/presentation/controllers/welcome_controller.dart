import '../../domain/entities/welcome_message.dart';
import '../../domain/usecases/get_welcome_message.dart';

class WelcomeController {
  final GetWelcomeMessage getWelcomeMessage;

  WelcomeController(this.getWelcomeMessage);

  Future<WelcomeMessage> fetchMessage() async {
    return await getWelcomeMessage();
  }
}
