import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/reducers/app_state_reducer.dart';
import 'package:todo_app/screens/main_screen/main_screen.dart';

void main() {
  final store = Store<AppState>(appStateReducer,
      initialState: AppState(
          todos: BuiltList.of([
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
      ])));
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
