import 'package:redux_epics/redux_epics.dart';
import 'package:todo_app/actions/todo_actions/todo_actions.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/repository/todo_repository/todo_repository.dart';

final todoEpics =
    combineEpics<AppState>([createTodoEpic, updateTodoStatusEpic, updateTodoNoteEpic, deleteTodoEpic, readTodoEpic]);

Stream<dynamic> createTodoEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions.where((action) => action is DoCreateTodoAction).asyncMap((action) {
    action = action as DoCreateTodoAction;
    return TodoRepository.createTodo(action.note)
        .then((value) => SetCreateTodoAction((reducerAction) => reducerAction..note = action.note));
  });
}

Stream<dynamic> updateTodoStatusEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions.where((action) => action is DoUpdateStatusTodoAction).asyncMap((middlewareAction) {
    middlewareAction = middlewareAction as DoUpdateStatusTodoAction;
    return TodoRepository.updateTodoStatus(middlewareAction.id, middlewareAction.isComplete)
        .then((value) => SetUpdateStatusTodoAction((action) => action
          ..id = middlewareAction.id
          ..isComplete = middlewareAction.isComplete));
  });
}

Stream<dynamic> updateTodoNoteEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions.where((action) => action is DoEditTodoAction).asyncMap((action) {
    action = action as DoEditTodoAction;
    return TodoRepository.updateTodoNote(action.id, action.note)
        .then((value) => SetEditTodoAction((reducerAction) => reducerAction
          ..note = action.note
          ..id = action.id));
  });
}

Stream<dynamic> deleteTodoEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions.where((action) => action is DoDeleteTodoAction).asyncMap((action) {
    action = action as DoDeleteTodoAction;
    return TodoRepository.deleteTodo(action.id)
        .then((value) => SetDeleteTodoAction((reducerAction) => reducerAction..id = action.id));
  });
}

Stream<dynamic> readTodoEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions.where((action) => action is DoReadTodoAction).asyncMap((action) =>
      TodoRepository.readTodos().then((todos) => SetReadTodoAction((action) => action..todos.addAll(todos))));
}
