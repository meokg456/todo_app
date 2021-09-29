import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todo_app/middlewares/todo_middleware/todo_middleware.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_state.dart';
import 'package:todo_app/reducers/app_state_reducer.dart';
import 'package:todo_app/screens/main_screen/main_screen.dart';
import 'package:todo_app/services/sqlite_services/sqlite_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.init(),
    middleware: [EpicMiddleware(todoEpics)],
  );
  runApp(TodoRedux(store));
}

class TodoRedux extends StatelessWidget {
  final Store<AppState> store;

  TodoRedux(this.store); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Todo Redux',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) => MainScreen(),
        },
      ),
    );
  }
}
