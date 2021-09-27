import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/app_tab/app_tab.dart';
import 'package:todo_app/models/todo/todo.dart';

class AppState {
  AppTab activeTab = AppTab.all;
  BuiltList todos = BuiltList.of([
    Todo((todo) => todo
      ..id = 1
      ..note = "Do exercise"
      ..isCompleted = false),
    Todo((todo) => todo
      ..id = 1
      ..note = "Eat breakfast"
      ..isCompleted = false),
    Todo((todo) => todo
      ..id = 1
      ..note = "Go to school"
      ..isCompleted = false),
    Todo((todo) => todo
      ..id = 1
      ..note = "Have launch"
      ..isCompleted = false),
    Todo((todo) => todo
      ..id = 1
      ..note = "Play video games"
      ..isCompleted = false),
    Todo((todo) => todo
      ..id = 1
      ..note = "Have Dinner"
      ..isCompleted = false)
  ]);
  bool isLoading = false;

  AppState({this.activeTab = AppTab.all, this.isLoading = false});

  factory AppState.loading() => AppState(isLoading: true);
}
