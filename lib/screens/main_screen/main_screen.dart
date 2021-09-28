import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/actions/create_todo_action/create_todo_action.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/screens/main_screen/completed_todos_tab/completed_todos_tab.dart';
import 'package:todo_app/screens/main_screen/incomplete_todos_tab/incomplete_todos_tab.dart';
import 'package:todo_app/screens/main_screen/todos_tab/todos_tab.dart';
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

  void onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabNames[_selectedIndex]),
        centerTitle: true,
      ),
      body: _tabViews[_selectedIndex],
      floatingActionButton: StoreConnector<AppState, Function(String)>(
        converter: (store) => (String note) => store.dispatch(CreateTodoAction(note)),
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
