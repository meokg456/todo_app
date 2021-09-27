import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/app_tab/app_tab.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/selectors/todo_selector/todo_selector.dart';
import 'package:todo_app/widgets/todo_widget/todo_widget.dart';

class TodosTab extends StatefulWidget {
  const TodosTab({Key? key}) : super(key: key);

  @override
  _TodoTabState createState() => _TodoTabState();
}

class _TodoTabState extends State<TodosTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, List<Todo>>(
        builder: (BuildContext context, todos) {
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoWidget(todos[index]);
              });
        },
        converter: (store) => todosFilter(todosSelector(store.state), AppTab.all),
      ),
    );
  }
}
