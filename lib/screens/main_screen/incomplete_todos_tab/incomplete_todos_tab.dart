import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo_filter_type/todo_filter_type.dart';
import 'package:todo_app/selectors/todo_selector/todo_selector.dart';
import 'package:todo_app/widgets/todo_widget/todo_widget.dart';

class IncompleteTodosTab extends StatefulWidget {
  const IncompleteTodosTab({Key? key}) : super(key: key);

  @override
  _IncompleteTodosTabState createState() => _IncompleteTodosTabState();
}

class _IncompleteTodosTabState extends State<IncompleteTodosTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, BuiltList<Todo>>(
        builder: (BuildContext context, todos) {
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoWidget(todos[index]);
              });
        },
        distinct: true,
        converter: (store) => todosFilter(store.state, TodoFilterType.incomplete),
      ),
    );
  }
}
