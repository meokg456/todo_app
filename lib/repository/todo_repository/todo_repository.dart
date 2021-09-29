import 'package:built_collection/built_collection.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/services/sqlite_services/sqlite_services.dart';

abstract class AbstractTodoRepository {
  Future<Todo> createTodo(String note);
  Future<void> updateTodoStatus(int id, bool? isCompleted);
  Future<void> updateTodoNote(int id, String note);
  Future<void> deleteTodo(int id);
  Future<BuiltList<Todo>> readTodos();
}

class TodoRepository implements AbstractTodoRepository {
  Future<Todo> createTodo(String note) async {
    return await SqliteServices.createTodo(note);
  }

  Future<void> updateTodoStatus(int id, bool? isCompleted) async {
    await SqliteServices.updateTodoStatus(id, isCompleted);
  }

  Future<void> updateTodoNote(int id, String note) async {
    await SqliteServices.updateTodoNote(id, note);
  }

  Future<void> deleteTodo(int id) async {
    await SqliteServices.deleteTodo(id);
  }

  Future<BuiltList<Todo>> readTodos() async {
    return await SqliteServices.readTodoList();
  }
}
