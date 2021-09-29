import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:todo_app/models/todo/todo.dart';

part 'todos_state.g.dart';

abstract class TodosState implements Built<TodosState, TodosStateBuilder> {
  TodosState._();

  factory TodosState([void Function(TodosStateBuilder) updates]) = _$TodosState;

  BuiltMap<int, Todo> get todos;

  BuiltList<int> get completedTodos;

  BuiltList<int> get incompleteTodos;

  bool get isLoading;
}
