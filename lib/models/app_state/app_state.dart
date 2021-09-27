import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/app_tab/app_tab.dart';
import 'package:todo_app/models/todo/todo.dart';

class AppState {
  AppTab activeTab = AppTab.all;
  BuiltList<Todo> todos;
  bool isLoading = false;

  AppState({this.activeTab = AppTab.all, this.isLoading = false, required this.todos});
}
