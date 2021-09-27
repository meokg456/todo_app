import 'package:built_value/built_value.dart';

part 'todo.g.dart';

abstract class Todo implements Built<Todo, TodoBuilder> {
  Todo._();
  factory Todo([void Function(TodoBuilder) updates]) = _$Todo;

  int get id;

  String get note;

  bool get isCompleted;
}
