import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/actions/delete_todo_action/delete_todo_action.dart';
import 'package:todo_app/actions/edit_todo_action/edit_todo_action.dart';
import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/widgets/confirm_dialog/confirm_dialog.dart';
import 'package:todo_app/widgets/todo_dialog/todo_dialog.dart';

class TodoActionSheet extends StatelessWidget {
  final Todo _todo;

  TodoActionSheet(this._todo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StoreConnector<AppState, Function(int id, String note)>(
            converter: (store) => (id, note) => store.dispatch(EditTodoAction(id, note)),
            builder: (context, editTodo) => ListTile(
              key: Key("edit"),
              onTap: () {
                showDialog(context: context, builder: (context) => TodoDialog(note: _todo.note)).then((value) {
                  if (value != null) {
                    editTodo(_todo.id, value);
                  }
                  Navigator.pop(context);
                });
              },
              leading: Icon(Icons.edit, color: Theme.of(context).primaryColor),
              title: Text(
                "Edit",
                style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          StoreConnector<AppState, Function(int id)>(
            converter: (store) => (id) => store.dispatch(DeleteTodoAction(id)),
            builder: (context, deleteTodo) => ListTile(
              key: Key("delete"),
              onTap: () {
                showDialog(
                        context: context,
                        builder: (context) => ConfirmDialog("Are you sure?", "Do you want to delete this todo?"))
                    .then((value) {
                  if (value == true) {
                    deleteTodo(_todo.id);
                  }
                  Navigator.pop(context);
                });
              },
              leading: Icon(Icons.delete_forever, color: Theme.of(context).errorColor),
              title: Text(
                "Delete",
                style: TextStyle(fontSize: 18, color: Theme.of(context).errorColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
