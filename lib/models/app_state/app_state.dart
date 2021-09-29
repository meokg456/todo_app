import 'package:built_collection/built_collection.dart';

import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_state.dart';

class AppState {
  TodosState todosModel = TodosState((model) => model
    ..todos = MapBuilder({})
    ..incompleteTodos = ListBuilder([])
    ..completedTodos = ListBuilder([])
    ..isLoading = false);
  bool isLoading = false;
  AppState.init();
  AppState({this.isLoading = false, required this.todosModel});
}
