import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/actions/create_todo_action/create_todo_action.dart';
import 'package:todo_app/actions/delete_todo_action/delete_todo_action.dart';
import 'package:todo_app/actions/edit_todo_action/edit_todo_action.dart';
import 'package:todo_app/actions/update_todo_status_action/update_todo_status_action.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_model.dart';
import 'package:todo_app/reducers/todo_reducer/todo_reducer.dart';

void main() {
  group("Test todo reducer", () {
    AppState? firstState;
    TodosModel Function({required int id, bool? isComplete})? updateTodoStatusReducer;
    TodosModel Function({required String note})? createTodoReducer;
    TodosModel Function({required int id, required String note})? editTodoReducer;
    TodosModel Function({required int id})? deleteTodoReducer;
    setUp(() {
      firstState = AppState.init();
      updateTodoStatusReducer = ({required int id, bool? isComplete}) {
        return todosReducer(firstState!.todosModel, UpdateTodoStatusAction(id, isComplete));
      };
      createTodoReducer = ({required String note}) {
        return todosReducer(firstState!.todosModel, CreateTodoAction(note));
      };
      editTodoReducer = ({required int id, required String note}) {
        return todosReducer(firstState!.todosModel, EditTodoAction(id, note));
      };
      deleteTodoReducer = ({required int id}) {
        return todosReducer(firstState!.todosModel, DeleteTodoAction(id));
      };
    });

    group("Test Update todo status action", () {
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
