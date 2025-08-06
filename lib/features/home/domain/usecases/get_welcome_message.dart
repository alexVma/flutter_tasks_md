import '../entities/welcome_message.dart';
import '../repositories/welcome_repository.dart';

class GetWelcomeMessage {
  final WelcomeRepository repository;

  GetWelcomeMessage(this.repository);

  Future<WelcomeMessage> call() async {
    return await repository.getWelcomeMessage();
  }
}
