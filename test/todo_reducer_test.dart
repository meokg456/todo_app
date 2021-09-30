import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/actions/todo_actions/todo_actions.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_state.dart';
import 'package:todo_app/reducers/todo_reducer/todo_reducer.dart';

void main() {
  group("Test todo reducer", () {
    var todos = ["Wake up", "Do exercises", "Eat breakfast", "Go to school", "Have lunch", "Sleep"];
    late AppState firstState;
    late TodosState Function({required int id, bool? isComplete}) updateTodoStatusReducer;
    late TodosState Function({required Todo todo}) createTodoReducer;
    late TodosState Function({required int id, required String note}) editTodoReducer;
    late TodosState Function({required int id}) deleteTodoReducer;
    late TodosState Function() readTodoReducer;
    setUp(() {
      firstState = AppState(todosState: TodosState((todosState) {
        for (int i = 0; i < todos.length; i++) {
          todosState
            ..todos[i + 1] = Todo((todo) => todo
              ..id = i + 1
              ..note = todos[i]
              ..isCompleted = false);
        }
        todosState.incompleteTodos.addAll([1, 2, 3, 4, 5, 6]);
        todosState..isLoading = false;
      }));
      updateTodoStatusReducer = ({required int id, bool? isComplete}) {
        return todosReducer(
            firstState.todosState,
            SetUpdateStatusTodoAction((action) => action
              ..isComplete = isComplete
              ..id = id));
      };
      createTodoReducer = ({required Todo todo}) {
        return todosReducer(firstState.todosState, SetCreateTodoAction((action) => action..todo = todo.toBuilder()));
      };
      editTodoReducer = ({required int id, required String note}) {
        return todosReducer(
            firstState.todosState,
            SetEditTodoAction((action) => action
              ..id = id
              ..note = note));
      };
      deleteTodoReducer = ({required int id}) {
        return todosReducer(firstState.todosState, SetDeleteTodoAction((action) => action..id = id));
      };
      readTodoReducer = () {
        return todosReducer(
            firstState.todosState,
            SetReadTodoAction((action) => action
              ..todos = ListBuilder([
                Todo((todo) => todo
                  ..id = 7
                  ..isCompleted = false
                  ..note = "Sleep"),
              ])));
      };
    });

    group("Test Update todo status action", () {
      test("Update todo status to true", () {
        final TodosState modifiedModel = updateTodoStatusReducer(id: 2, isComplete: true);
        expect(
            modifiedModel,
            firstState.todosState.rebuild((model) => model
              ..todos.updateValue(2, (todo) => todo.rebuild((todo) => todo.isCompleted = true))
              ..incompleteTodos.remove(2)
              ..completedTodos.add(2)
              ..completedTodos.sort()));
      });
      test("Update todo status to false", () {
        final TodosState modifiedModel = updateTodoStatusReducer(id: 1, isComplete: false);
        expect(
            modifiedModel,
            firstState.todosState.rebuild((model) => model
              ..todos.updateValue(1, (todo) => todo.rebuild((todo) => todo.isCompleted = false))
              ..incompleteTodos.add(1)
              ..incompleteTodos.sort()
              ..completedTodos.remove(1)));
      });
      test("Update todo status to null", () {
        final TodosState modifiedModel = updateTodoStatusReducer(id: 1, isComplete: null);
        expect(
            modifiedModel,
            firstState.todosState.rebuild((model) => model
              ..todos.updateValue(1, (todo) => todo.rebuild((todo) => todo.isCompleted = false))
              ..incompleteTodos.add(1)
              ..incompleteTodos.sort()
              ..completedTodos.remove(1)));
      });
    });
    group("Create todo action", () {
      test("Create todo with note", () {
        String note = "Sleep";
        int id = firstState.todosState.todos.length + 1;
        final modifiedModel = createTodoReducer(
            todo: Todo((todo) => todo
              ..note = note
              ..id = id
              ..isCompleted = false));
        expect(
            modifiedModel,
            firstState.todosState.rebuild((model) => model
              ..todos[id] = Todo((todo) => todo
                ..note = note
                ..id = id
                ..isCompleted = false)
              ..incompleteTodos.add(id)));
      });
      test("Create todo with empty note", () {
        String note = "";
        final modifiedModel = createTodoReducer(
            todo: Todo((todo) => todo
              ..note = note
              ..id = firstState.todosState.todos.length + 1
              ..isCompleted = false));
        expect(modifiedModel, firstState.todosState);
      });
    });

    group("Edit todo action", () {
      test("Edit todo with note", () {
        String note = "Play games";
        final modifiedModel = editTodoReducer(id: 5, note: note);
        expect(
            modifiedModel,
            firstState.todosState
                .rebuild((model) => model..todos.updateValue(5, (todo) => todo.rebuild((todo) => todo..note = note))));
      });
      test("Edit todo with empty note", () {
        String note = "";
        final modifiedModel = editTodoReducer(id: 5, note: note);
        expect(modifiedModel, firstState.todosState);
      });

      test("Edit todo with invalid id", () {
        String note = "Play games";
        final modifiedModel = editTodoReducer(id: 10, note: note);
        expect(modifiedModel, firstState.todosState);
      });
    });

    group("Delete todo action", () {
      test("Delete todo", () {
        final modifiedModel = deleteTodoReducer(id: 5);
        expect(
            modifiedModel,
            firstState.todosState
                .rebuild((model) => model..todos.remove(5)..incompleteTodos.remove(5)..completedTodos.remove(5)));
      });

      test("Edit todo with invalid id", () {
        final modifiedModel = deleteTodoReducer(id: 10);
        expect(modifiedModel, firstState.todosState);
      });
    });
    group("Read todos action", () {
      test("Read todos", () {
        final modifiedModel = readTodoReducer();
        expect(
            modifiedModel,
            firstState.todosState.rebuild((todosState) => todosState
              ..todos[7] = Todo((todo) => todo
                ..id = 7
                ..isCompleted = false
                ..note = "Sleep")
              ..incompleteTodos.add(7)));
      });
    });
  });
}
