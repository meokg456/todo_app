import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todo_app/actions/todo_actions/todo_actions.dart';
import 'package:todo_app/middlewares/todo_middleware/todo_middleware.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/reducers/app_state_reducer.dart';
import 'package:todo_app/repository/todo_repository/todo_repository.dart';

import 'todo_middleware_test.mocks.dart';

@GenerateMocks([TodoRepository, AppState])
void main() {
  group("Middleware test", () {
    BuiltList<Todo> todos = BuiltList<Todo>([
      Todo((todo) => todo
        ..note = "Wake up"
        ..id = 1
        ..isCompleted = false),
      Todo((todo) => todo
        ..note = "Do exercises"
        ..id = 1
        ..isCompleted = false),
      Todo((todo) => todo
        ..note = "Eat breakfast"
        ..id = 1
        ..isCompleted = false),
      Todo((todo) => todo
        ..note = "Go to school"
        ..id = 1
        ..isCompleted = false),
      Todo((todo) => todo
        ..note = "Have lunch"
        ..id = 1
        ..isCompleted = false),
      Todo((todo) => todo
        ..note = "Sleep"
        ..id = 1
        ..isCompleted = false),
    ]);
    MockTodoRepository todoRepository = MockTodoRepository();
    TodoMiddleware todoMiddleware = TodoMiddleware(todoRepository);

    Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.init(),
      middleware: [
        EpicMiddleware(todoMiddleware.call),
      ],
    );

    test("Read todos test", () async {
      when(todoRepository.readTodos()).thenAnswer((_) async => todos);
      Stream<dynamic> stream =
          todoMiddleware.call(Stream.fromIterable([DoReadTodoAction()]).asBroadcastStream(), EpicStore(store));
      expect(await stream.toList(), [SetReadTodoAction((action) => action..todos.addAll(todos))]);
    });

    test("Create todo test", () async {
      when(todoRepository.createTodo("Wake up")).thenAnswer((_) async => Todo((todo) => todo
        ..note = "Wake up"
        ..id = 1
        ..isCompleted = false));
      Stream<dynamic> stream = todoMiddleware.call(
          Stream.fromIterable([DoCreateTodoAction((action) => action..note = "Wake up")]).asBroadcastStream(),
          EpicStore(store));
      expect(await stream.toList(), [
        SetCreateTodoAction((action) => action
          ..todo.update((todo) => todo
            ..id = 1
            ..note = "Wake up"
            ..isCompleted = false))
      ]);
    });

    test("Create todo with empty note test", () async {
      when(todoRepository.createTodo("")).thenAnswer((_) async => Todo((todo) => todo
        ..note = ""
        ..id = 1
        ..isCompleted = false));
      Stream<dynamic> stream = todoMiddleware.call(
          Stream.fromIterable([DoCreateTodoAction((action) => action..note = "")]).asBroadcastStream(),
          EpicStore(store));
      expect(await stream.toList(), [null]);
    });

    test("Update todo status test", () async {
      when(todoRepository.updateTodoStatus(1, true)).thenAnswer((_) async => {});
      Stream<dynamic> stream = todoMiddleware.call(
          Stream.fromIterable([
            DoUpdateStatusTodoAction((action) => action
              ..id = 1
              ..isComplete = true)
          ]).asBroadcastStream(),
          EpicStore(store));
      expect(await stream.toList(), [
        SetUpdateStatusTodoAction((action) => action
          ..id = 1
          ..isComplete = true)
      ]);
    });

    test("Update todo note test", () async {
      when(todoRepository.updateTodoNote(1, "Sleep")).thenAnswer((_) async => {});
      Stream<dynamic> stream = todoMiddleware.call(
          Stream.fromIterable([
            DoEditTodoAction((action) => action
              ..id = 1
              ..note = "Sleep")
          ]).asBroadcastStream(),
          EpicStore(store));
      expect(await stream.toList(), [
        SetEditTodoAction((action) => action
          ..id = 1
          ..note = "Sleep")
      ]);
    });

    test("Update todo note test with empty", () async {
      when(todoRepository.updateTodoNote(1, "Sleep")).thenAnswer((_) async => {});
      Stream<dynamic> stream = todoMiddleware.call(
          Stream.fromIterable([
            DoEditTodoAction((action) => action
              ..id = 1
              ..note = "")
          ]).asBroadcastStream(),
          EpicStore(store));
      expect(await stream.toList(), [null]);
    });

    test("Delete todo test", () async {
      when(todoRepository.deleteTodo(1)).thenAnswer((_) async => {});
      Stream<dynamic> stream = todoMiddleware.call(
          Stream.fromIterable([DoDeleteTodoAction((action) => action..id = 1)]).asBroadcastStream(), EpicStore(store));
      expect(await stream.toList(), [SetDeleteTodoAction((action) => action..id = 1)]);
    });
  });
}
