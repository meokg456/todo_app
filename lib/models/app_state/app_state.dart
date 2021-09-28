import 'package:built_collection/built_collection.dart';

import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_model.dart';

class AppState {
  TodosModel todosModel = TodosModel(
    (model) => model
      ..todos = MapBuilder({
        1: Todo((todo) => todo
          ..id = 1
          ..note = "Do exercise"
          ..isCompleted = true),
        2: Todo((todo) => todo
          ..id = 2
          ..note = "Eat breakfast"
          ..isCompleted = false),
        3: Todo((todo) => todo
          ..id = 3
          ..note = "Go to school"
          ..isCompleted = true),
        4: Todo((todo) => todo
          ..id = 4
          ..note = "Have launch"
          ..isCompleted = false),
        5: Todo((todo) => todo
          ..id = 5
          ..note = "Play video games"
          ..isCompleted = false),
        6: Todo((todo) => todo
          ..id = 6
          ..note = "Have Dinner"
          ..isCompleted = false)
      })
      ..completedTodos = ListBuilder([1, 3])
      ..incompleteTodos = ListBuilder([2, 4, 5, 6]),
  );
  bool isLoading = false;
  AppState.init();
  AppState({this.isLoading = false, required this.todosModel});
}
