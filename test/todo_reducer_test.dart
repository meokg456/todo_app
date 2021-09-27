import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/actions/update_todo_status_action/update_todo_status_action.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/reducers/todo_reducer/todo_reducer.dart';

void main() {
  var appState = AppState(
      todos: BuiltList<Todo>.of([
    Todo((todo) => todo
      ..id = 1
      ..note = "Do exercise"
      ..isCompleted = true),
    Todo((todo) => todo
      ..id = 2
      ..note = "Eat breakfast"
      ..isCompleted = false),
    Todo((todo) => todo
      ..id = 3
      ..note = "Go to school"
      ..isCompleted = true),
    Todo((todo) => todo
      ..id = 4
      ..note = "Have launch"
      ..isCompleted = false),
    Todo((todo) => todo
      ..id = 5
      ..note = "Play video games"
      ..isCompleted = false),
    Todo((todo) => todo
      ..id = 6
      ..note = "Have Dinner"
      ..isCompleted = false)
  ]));

  test("Todo reducer - Update todo status", () {
    var todos = todosReducer(appState.todos, UpdateTodoStatusAction(1, false));
    expect(todos[0].isCompleted, false);
    todos = todosReducer(todos, UpdateTodoStatusAction(2, true));
    expect(todos[1].isCompleted, true);
    todos = todosReducer(todos, UpdateTodoStatusAction(2, false));
    expect(todos[1].isCompleted, false);
    todos = todosReducer(todos, UpdateTodoStatusAction(2, null));
    expect(todos[1].isCompleted, false);
  });
}
