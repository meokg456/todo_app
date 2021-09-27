import 'package:flutter/material.dart';
import 'package:todo_app/models/todo/todo.dart';

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
      leading: Icon(
        Icons.task,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(widget.todo.note),
      trailing: Checkbox(
        value: widget.todo.isCompleted,
        onChanged: (bool? value) {},
      ),
    );
  }
}
