import '../entities/welcome_message.dart';

abstract class WelcomeRepository {
  Future<WelcomeMessage> getWelcomeMessage();
}
