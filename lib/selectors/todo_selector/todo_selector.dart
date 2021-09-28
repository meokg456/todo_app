import 'package:built_collection/built_collection.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_model.dart';
import 'package:todo_app/models/todo_filter_type/todo_filter_type.dart';

BuiltList<Todo> todosFilter(AppState appState, TodoFilterType type) {
  var todosModel = appState.todosModel;
  switch (type) {
    case TodoFilterType.completed:
      return todosModel.completedTodos.map((id) => todosModel.todos[id]!).toBuiltList();

    case TodoFilterType.incomplete:
      return todosModel.incompleteTodos.map((id) => todosModel.todos[id]!).toBuiltList();

    default:
      return todosModel.todos.values.toBuiltList();
  }
}
