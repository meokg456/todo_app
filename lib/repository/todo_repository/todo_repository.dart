import 'package:built_collection/built_collection.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/services/sqlite_services/sqlite_services.dart';

class TodoRepository {
  static Future<Todo> createTodo(String note) async {
    return await SqliteServices.createTodo(note);
  }

  static Future<void> updateTodoStatus(int id, bool? isCompleted) async {
    await SqliteServices.updateTodoStatus(id, isCompleted);
  }

  static Future<void> updateTodoNote(int id, String note) async {
    await SqliteServices.updateTodoNote(id, note);
  }

  static Future<void> deleteTodo(int id) async {
    await SqliteServices.deleteTodo(id);
  }

  static Future<BuiltList<Todo>> readTodos() async {
    return await SqliteServices.readTodoList();
  }
}
