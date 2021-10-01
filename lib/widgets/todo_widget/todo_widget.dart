import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/actions/todo_actions/todo_actions.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/widgets/todo_action_sheet/todo_action_sheet.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget(this.todo);

  final Todo todo;

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key("todo${widget.todo.id}"),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => TodoActionSheet(
                  widget.todo,
                ));
      },
      leading: Icon(
        Icons.task,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(widget.todo.note),
      trailing: StoreConnector<AppState, Function(bool?)>(
        converter: (store) => (bool? value) {
          store.dispatch(DoUpdateStatusTodoAction((action) => action
            ..id = widget.todo.id
            ..isComplete = !widget.todo.isCompleted));
        },
        distinct: true,
        builder: (context, onCheckBox) => Checkbox(
          key: Key("checkbox${widget.todo.id}"),
          value: widget.todo.isCompleted,
          onChanged: onCheckBox,
        ),
      ),
    );
  }
}
