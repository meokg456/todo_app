import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/actions/update_tab_action/update_tab_action.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/app_tab/app_tab.dart';
import 'package:todo_app/screens/main_screen/completed_todos_tab/completed_todos_tab.dart';
import 'package:todo_app/screens/main_screen/incomplete_todos_tab/incomplete_todos_tab.dart';
import 'package:todo_app/screens/main_screen/todos_tab/todos_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final tabNames = ["Todos", "Incomplete", "Completed"];
  final tabViews = [TodosTab(), IncompleteTodosTab(), CompletedTodosTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StoreConnector<AppState, String>(
          converter: (store) => tabNames[store.state.activeTab.index],
          builder: (context, tabName) {
            return Text(tabName);
          },
        ),
        centerTitle: true,
      ),
      body: StoreConnector<AppState, int>(
        converter: (store) => store.state.activeTab.index,
        builder: (context, index) {
          return tabViews[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {},
      ),
      bottomNavigationBar: StoreConnector<AppState, _BottomNavigationBarViewModel>(
        converter: (store) => _BottomNavigationBarViewModel.fromStore(store),
        builder: (context, model) => BottomNavigationBar(
          currentIndex: model.index,
          onTap: model.onTabSelected,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Todos"),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Incomplete"),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Completed"),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationBarViewModel {
  int index;
  Function(int) onTabSelected;

  _BottomNavigationBarViewModel(this.index, this.onTabSelected);

  factory _BottomNavigationBarViewModel.fromStore(Store<AppState> store) => _BottomNavigationBarViewModel(
      store.state.activeTab.index, (index) => store.dispatch(UpdateTabAction(AppTab.values[index])));
}
