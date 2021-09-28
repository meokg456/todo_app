import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/actions/update_todo_status_action/update_todo_status_action.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_model.dart';
import 'package:todo_app/reducers/todo_reducer/todo_reducer.dart';

void main() {
  group("Test Update todo status action", () {
    AppState? firstState;
    TodosModel Function({required int id, bool? isComplete})? updateTodoStatusReducer;
    setUp(() {
      firstState = AppState.init();
      updateTodoStatusReducer = ({required int id, bool? isComplete}) {
        return todosReducer(firstState!.todosModel, UpdateTodoStatusAction(id, isComplete));
      };
    });
    test("Update todo status to true", () {
      final TodosModel modifiedModel = updateTodoStatusReducer!(id: 2, isComplete: true);
      expect(
          modifiedModel,
          firstState!.todosModel.rebuild((model) => model
            ..todos.updateValue(2, (todo) => todo.rebuild((todo) => todo.isCompleted = true))
            ..incompleteTodos.remove(2)
            ..completedTodos.add(2)));
    });
    test("Update todo status to false", () {
      final TodosModel modifiedModel = updateTodoStatusReducer!(id: 1, isComplete: false);
      expect(
          modifiedModel,
          firstState!.todosModel.rebuild((model) => model
            ..todos.updateValue(1, (todo) => todo.rebuild((todo) => todo.isCompleted = false))
            ..incompleteTodos.add(1)
            ..completedTodos.remove(1)));
    });
    test("Update todo status to null", () {
      final TodosModel modifiedModel = updateTodoStatusReducer!(id: 1, isComplete: null);
      expect(
          modifiedModel,
          firstState!.todosModel.rebuild((model) => model
            ..todos.updateValue(1, (todo) => todo.rebuild((todo) => todo.isCompleted = false))
            ..incompleteTodos.add(1)
            ..completedTodos.remove(1)));
    });
  });
}
