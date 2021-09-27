import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/app_tab/app_tab.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/selectors/todo_selector/todo_selector.dart';
import 'package:todo_app/widgets/todo_widget/todo_widget.dart';

class CompletedTodosTab extends StatefulWidget {
  const CompletedTodosTab({Key? key}) : super(key: key);

  @override
  _CompletedTodosTabState createState() => _CompletedTodosTabState();
}

class _CompletedTodosTabState extends State<CompletedTodosTab> {
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
        converter: (store) => todosFilter(todosSelector(store.state), AppTab.completed),
      ),
    );
  }
}
