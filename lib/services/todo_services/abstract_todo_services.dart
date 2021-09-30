import 'package:built_collection/built_collection.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/models/todo/todo.dart';

abstract class AbstractTodoServices {
  Future<Todo> createTodo(String note);
  Future<void> updateTodoStatus(int id, bool? isCompleted);
  Future<void> updateTodoNote(int id, String note);
  Future<void> deleteTodo(int id);
  Future<BuiltList<Todo>> readTodoList();
}
