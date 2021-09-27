import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/actions/update_todo_status_action/update_todo_status_action.dart';
import 'package:todo_app/models/todo/todo.dart';

final todosReducer = combineReducers<BuiltList<Todo>>([TypedReducer(_updateTodoStatus)]);

BuiltList<Todo> _updateTodoStatus(BuiltList<Todo> todos, UpdateTodoStatusAction action) {
  return BuiltList<Todo>.of(todos
      .map((todo) => todo.id == action.id ? todo.rebuild((t) => t..isCompleted = action.isComplete ?? false) : todo));
}
