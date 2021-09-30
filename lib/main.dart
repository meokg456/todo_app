import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todo_app/dependency.dart';
import 'package:todo_app/middlewares/todo_middleware/todo_middleware.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_state.dart';
import 'package:todo_app/reducers/app_state_reducer.dart';
import 'package:todo_app/repository/todo_repository/todo_repository.dart';
import 'package:todo_app/screens/main_screen/main_screen.dart';
import 'package:todo_app/services/todo_services/abstract_todo_services.dart';
import 'package:todo_app/services/todo_services/sqlite_todo_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt.allReady();
  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.init(),
    middleware: [
      EpicMiddleware(getIt.get<TodoMiddleware>().call),
    ],
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
