import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:todo_app/models/todo/todo.dart';

part 'todos_model.g.dart';

abstract class TodosModel implements Built<TodosModel, TodosModelBuilder> {
  TodosModel._();

  factory TodosModel([void Function(TodosModelBuilder) updates]) = _$TodosModel;

  BuiltMap<int, Todo> get todos;

  BuiltList<int> get completedTodos;

  BuiltList<int> get incompleteTodos;
}
