import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/actions/todo_actions/todo_actions.dart';
import 'package:todo_app/dependency.dart';
import 'package:todo_app/middlewares/todo_middleware/todo_middleware.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/repository/todo_repository/todo_repository.dart';
import 'package:todo_app/screens/main_screen/completed_todos_tab/completed_todos_tab.dart';
import 'package:todo_app/screens/main_screen/incomplete_todos_tab/incomplete_todos_tab.dart';
import 'package:todo_app/screens/main_screen/todos_tab/todos_tab.dart';
import 'package:todo_app/services/todo_services/abstract_todo_services.dart';
import 'package:todo_app/services/todo_services/sqlite_todo_services.dart';
import 'package:todo_app/widgets/todo_dialog/todo_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _tabNames = ["Todos", "Incomplete", "Completed"];
  final _tabViews = [TodosTab(), IncompleteTodosTab(), CompletedTodosTab()];
  int _selectedIndex = 0;

  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) async {
      StoreProvider.of<AppState>(context).dispatch(SetLoadingTodoAction());
      StoreProvider.of<AppState>(context).dispatch(DoReadTodoAction());
    });
    super.initState();
  }

  void onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
      print("Selected tab: $_selectedIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabNames[_selectedIndex]),
        centerTitle: true,
      ),
      body: StoreConnector<AppState, bool>(
        builder: (context, isLoading) => isLoading
            ? Center(
                child: CircularProgressIndicator(
                key: Key("load"),
              ))
            : _tabViews[_selectedIndex],
        converter: (store) => store.state.todosState.isLoading,
        distinct: true,
      ),
      floatingActionButton: StoreConnector<AppState, Function(String)>(
        converter: (store) => (String note) => store.dispatch(DoCreateTodoAction((action) => action..note = note)),
        distinct: true,
        builder: (context, createTodo) => FloatingActionButton(
          key: Key("create"),
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(context: context, builder: (context) => TodoDialog()).then((value) {
              if (value != null) {
                createTodo(value);
              }
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onTabSelected,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.task,
                key: const Key("todos"),
              ),
              label: "Todos"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.task,
                key: const Key("incomplete"),
              ),
              label: "Incomplete"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.task,
                key: const Key("completed"),
              ),
              label: "Completed"),
        ],
      ),
    );
  }
}
