import 'package:formz/formz.dart';

enum TextInputError { empty }

class TextInput extends FormzInput<String, TextInputError> {
  const TextInput.pure() : super.pure('');
  const TextInput.dirty([String value = '']) : super.dirty(value);

  @override
  TextInputError? validator(String value) {
    return value.trim().isEmpty ? TextInputError.empty : null;
  }

  
}
