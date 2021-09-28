import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/actions/create_todo_action/create_todo_action.dart';
import 'package:todo_app/actions/update_todo_status_action/update_todo_status_action.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_model.dart';

final todosReducer = combineReducers<TodosModel>([
  TypedReducer(_updateTodoStatus),
  TypedReducer(_createTodo),
]);

TodosModel _updateTodoStatus(TodosModel todosModel, UpdateTodoStatusAction action) {
  //update todo.isComplete
  var result = todosModel.rebuild((model) => model.todos
      .updateValue(action.id, (todo) => todo.rebuild((todo) => todo.isCompleted = action.isComplete ?? false)));
  //update completed and incomplete todos list
  if (action.isComplete ?? false) {
    return result.rebuild((model) => model
      ..completedTodos.add(action.id)
      ..incompleteTodos.remove(action.id));
  } else {
    return result.rebuild((model) => model
      ..incompleteTodos.add(action.id)
      ..completedTodos.remove(action.id));
  }
}

TodosModel _createTodo(TodosModel todosModel, CreateTodoAction action) {
  if (action.note.isEmpty) return todosModel;
  int id = todosModel.todos.length + 1;
  return todosModel.rebuild((model) => model
    ..todos[id] = Todo((todo) => todo
      ..note = action.note
      ..isCompleted = false
      ..id = id)
    ..incompleteTodos.add(id));
}
