import 'package:built_collection/built_collection.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/app_tab/app_tab.dart';
import 'package:todo_app/models/todo/todo.dart';

BuiltList<Todo> todosSelector(AppState appState) => appState.todos;

List<Todo> todosFilter(BuiltList<Todo> todos, AppTab appTab) {
  switch (appTab) {
    case AppTab.completed:
      return todos.where((todo) => todo.isCompleted).toList();

    case AppTab.incomplete:
      return todos.where((todo) => !todo.isCompleted).toList();

    default:
      return todos.toList();
  }
}
