import 'package:built_collection/built_collection.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/services/todo_services/abstract_todo_services.dart';
import 'package:todo_app/services/todo_services/sqlite_todo_services.dart';

abstract class AbstractTodoRepository {
  Future<Todo> createTodo(String note);
  Future<void> updateTodoStatus(int id, bool? isCompleted);
  Future<void> updateTodoNote(int id, String note);
  Future<void> deleteTodo(int id);
  Future<BuiltList<Todo>> readTodos();
}

@named
@Injectable(as: AbstractTodoRepository)
class TodoRepository implements AbstractTodoRepository {
  AbstractTodoServices services;

  TodoRepository(@Named.from(SqliteServices) this.services);

  Future<Todo> createTodo(String note) async {
    return await services.createTodo(note);
  }

  Future<void> updateTodoStatus(int id, bool? isCompleted) async {
    await services.updateTodoStatus(id, isCompleted);
  }

  Future<void> updateTodoNote(int id, String note) async {
    await services.updateTodoNote(id, note);
  }

  Future<void> deleteTodo(int id) async {
    await services.deleteTodo(id);
  }

  Future<BuiltList<Todo>> readTodos() async {
    return await services.readTodoList();
  }
}
