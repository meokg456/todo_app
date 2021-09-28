import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/actions/update_todo_status_action/update_todo_status_action.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/reducers/todo_reducer/todo_reducer.dart';
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
          store.dispatch(UpdateTodoStatusAction(widget.todo.id, !widget.todo.isCompleted));
        },
        builder: (context, onCheckBox) => Checkbox(
          key: Key("checkbox${widget.todo.id}"),
          value: widget.todo.isCompleted,
          onChanged: onCheckBox,
        ),
      ),
    );
  }
}
