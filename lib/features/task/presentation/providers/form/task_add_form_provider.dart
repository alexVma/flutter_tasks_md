import 'package:formz/formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tasks_md/core/core.dart';


final taskFormProvider = StateNotifierProvider<TaskFormNotifier, TaskFormState>((ref) {


  return TaskFormNotifier(
    
  );
});



class TaskFormNotifier extends StateNotifier<TaskFormState> {
  TaskFormNotifier() : super(TaskFormState());

  void onTitleChanged(String value) {
    final title = TextInput.dirty(value);
    state = state.copyWith(
      title: title,
      status: Formz.validate([title, state.description, state.isImportant]),
    );
  }

  void onDescriptionChanged(String value) {
    final description = TextInput.dirty(value);
    state = state.copyWith(
      description: description,
      status: Formz.validate([state.title, description, state.isImportant]),
    );
  }

  void onIsDone(bool value) {
    final isImportant = CheckboxInput.dirty(value);
    state = state.copyWith(
      isImportant: isImportant,
      status: Formz.validate([state.title, state.description, isImportant]),
    );
  }
}



class TaskFormState {
  final TextInput title;
  final TextInput description;
  final CheckboxInput isImportant;
  final bool status;

  TaskFormState({
    this.title = const TextInput.pure(),
    this.description = const TextInput.pure(),
    this.isImportant = const CheckboxInput.pure(),
    this.status = false,
  });

  TaskFormState copyWith({
    TextInput? title,
    TextInput? description,
    CheckboxInput? isImportant,
    bool? status,
  }) {
    return TaskFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      isImportant: isImportant ?? this.isImportant,
      status: status ?? this.status,
    );
  }
}

