import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/screens/main_screen/completed_todos_tab/completed_todos_tab.dart';
import 'package:todo_app/screens/main_screen/incomplete_todos_tab/incomplete_todos_tab.dart';
import 'package:todo_app/screens/main_screen/todos_tab/todos_tab.dart';

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
        title: StoreConnector<AppState, String>(
          converter: (store) => _tabNames[_selectedIndex],
          builder: (context, tabName) {
            return Text(tabName);
          },
        ),
        centerTitle: true,
      ),
      body: _tabViews[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onTabSelected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Todos"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Incomplete"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Completed"),
        ],
      ),
    );
  }
}
