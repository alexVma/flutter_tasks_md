import 'package:formz/formz.dart';

enum CheckboxInputError { unchecked }

class CheckboxInput extends FormzInput<bool, CheckboxInputError> {
  const CheckboxInput.pure() : super.pure(false);
  const CheckboxInput.dirty([bool value = false]) : super.dirty(value);

  @override
  CheckboxInputError? validator(bool value) {
    return value ? null : CheckboxInputError.unchecked;
  }
}
