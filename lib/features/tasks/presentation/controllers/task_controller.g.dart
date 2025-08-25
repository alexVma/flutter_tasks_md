// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllTasksHash() => r'54d899ac19029bad55fd1c75edbf88629ec1d317';

/// See also [getAllTasks].
@ProviderFor(getAllTasks)
final getAllTasksProvider = AutoDisposeProvider<GetAllTasks>.internal(
  getAllTasks,
  name: r'getAllTasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllTasksRef = AutoDisposeProviderRef<GetAllTasks>;
String _$addTaskHash() => r'646c6be34d3ac4d0405a3380ef885177e4179c8c';

/// See also [addTask].
@ProviderFor(addTask)
final addTaskProvider = AutoDisposeProvider<AddTask>.internal(
  addTask,
  name: r'addTaskProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addTaskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddTaskRef = AutoDisposeProviderRef<AddTask>;
String _$toggleTaskCompletionHash() =>
    r'f2ec0fc9a38fdb872c3eafad0719d152c682229a';

/// See also [toggleTaskCompletion].
@ProviderFor(toggleTaskCompletion)
final toggleTaskCompletionProvider =
    AutoDisposeProvider<ToggleTaskCompletion>.internal(
  toggleTaskCompletion,
  name: r'toggleTaskCompletionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$toggleTaskCompletionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ToggleTaskCompletionRef = AutoDisposeProviderRef<ToggleTaskCompletion>;
String _$taskRepositoryHash() => r'07b4d1d8e043937f963e52f66b966b9aaa3cebc5';

/// See also [taskRepository].
@ProviderFor(taskRepository)
final taskRepositoryProvider = AutoDisposeProvider<TaskRepository>.internal(
  taskRepository,
  name: r'taskRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TaskRepositoryRef = AutoDisposeProviderRef<TaskRepository>;
String _$taskControllerHash() => r'c7fbec77e086164452a90ee5abb2645e97003252';

/// See also [TaskController].
@ProviderFor(TaskController)
final taskControllerProvider =
    AutoDisposeAsyncNotifierProvider<TaskController, List<Task>>.internal(
  TaskController.new,
  name: r'taskControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskController = AutoDisposeAsyncNotifier<List<Task>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
