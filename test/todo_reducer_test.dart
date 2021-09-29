import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/actions/todo_actions/todo_actions.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_state.dart';
import 'package:todo_app/reducers/todo_reducer/todo_reducer.dart';

void main() {
  group("Test todo reducer", () {
    AppState? firstState;
    TodosState Function({required int id, bool? isComplete})? updateTodoStatusReducer;
    TodosState Function({required String note})? createTodoReducer;
    TodosState Function({required int id, required String note})? editTodoReducer;
    TodosState Function({required int id})? deleteTodoReducer;
    setUp(() {
      firstState = AppState.init();
      updateTodoStatusReducer = ({required int id, bool? isComplete}) {
        return todosReducer(
            firstState!.todosModel,
            DoUpdateStatusTodoAction((action) => action
              ..isComplete = isComplete
              ..id = id));
      };
      createTodoReducer = ({required String note}) {
        return todosReducer(firstState!.todosModel, DoCreateTodoAction((action) => action..note = note));
      };
      editTodoReducer = ({required int id, required String note}) {
        return todosReducer(
            firstState!.todosModel,
            DoEditTodoAction((action) => action
              ..id = id
              ..note = note));
      };
      deleteTodoReducer = ({required int id}) {
        return todosReducer(firstState!.todosModel, DoDeleteTodoAction((action) => action..id = id));
      };
    });

    group("Test Update todo status action", () {
      test("Update todo status to true", () {
        final TodosState modifiedModel = updateTodoStatusReducer!(id: 2, isComplete: true);
        expect(
            modifiedModel,
            firstState!.todosModel.rebuild((model) => model
              ..todos.updateValue(2, (todo) => todo.rebuild((todo) => todo.isCompleted = true))
              ..incompleteTodos.remove(2)
              ..completedTodos.add(2)
              ..completedTodos.sort()));
      });
      test("Update todo status to false", () {
        final TodosState modifiedModel = updateTodoStatusReducer!(id: 1, isComplete: false);
        expect(
            modifiedModel,
            firstState!.todosModel.rebuild((model) => model
              ..todos.updateValue(1, (todo) => todo.rebuild((todo) => todo.isCompleted = false))
              ..incompleteTodos.add(1)
              ..incompleteTodos.sort()
              ..completedTodos.remove(1)));
      });
      test("Update todo status to null", () {
        final TodosState modifiedModel = updateTodoStatusReducer!(id: 1, isComplete: null);
        expect(
            modifiedModel,
            firstState!.todosModel.rebuild((model) => model
              ..todos.updateValue(1, (todo) => todo.rebuild((todo) => todo.isCompleted = false))
              ..incompleteTodos.add(1)
              ..incompleteTodos.sort()
              ..completedTodos.remove(1)));
      });
    });
    group("Create todo action", () {
      test("Create todo with note", () {
        String note = "Sleep";
        int id = firstState!.todosModel.todos.length + 1;
        final modifiedModel = createTodoReducer!(note: note);
        expect(
            modifiedModel,
            firstState!.todosModel.rebuild((model) => model
              ..todos[id] = Todo((todo) => todo
                ..note = note
                ..id = id
                ..isCompleted = false)
              ..incompleteTodos.add(id)));
      });
      test("Create todo with empty note", () {
        String note = "";
        final modifiedModel = createTodoReducer!(note: note);
        expect(modifiedModel, firstState!.todosModel);
      });
    });

    group("Edit todo action", () {
      test("Edit todo with note", () {
        String note = "Play games";
        final modifiedModel = editTodoReducer!(id: 5, note: note);
        expect(
            modifiedModel,
            firstState!.todosModel
                .rebuild((model) => model..todos.updateValue(5, (todo) => todo.rebuild((todo) => todo..note = note))));
      });
      test("Edit todo with empty note", () {
        String note = "";
        final modifiedModel = editTodoReducer!(id: 5, note: note);
        expect(modifiedModel, firstState!.todosModel);
      });

      test("Edit todo with invalid id", () {
        String note = "Play games";
        final modifiedModel = editTodoReducer!(id: 10, note: note);
        expect(modifiedModel, firstState!.todosModel);
      });
    });

    group("Delete todo action", () {
      test("Delete todo", () {
        final modifiedModel = deleteTodoReducer!(id: 5);
        expect(
            modifiedModel,
            firstState!.todosModel
                .rebuild((model) => model..todos.remove(5)..incompleteTodos.remove(5)..completedTodos.remove(5)));
      });

      test("Edit todo with invalid id", () {
        final modifiedModel = deleteTodoReducer!(id: 10);
        expect(modifiedModel, firstState!.todosModel);
      });
    });
  });
}
