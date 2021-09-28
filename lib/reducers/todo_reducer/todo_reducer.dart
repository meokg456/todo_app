import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/actions/create_todo_action/create_todo_action.dart';
import 'package:todo_app/actions/delete_todo_action/delete_todo_action.dart';
import 'package:todo_app/actions/edit_todo_action/edit_todo_action.dart';
import 'package:todo_app/actions/update_todo_status_action/update_todo_status_action.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_model.dart';

final todosReducer = combineReducers<TodosModel>([
  TypedReducer(_updateTodoStatus),
  TypedReducer(_createTodo),
  TypedReducer(_editTodo),
  TypedReducer(_deleteTodo),
]);

TodosModel _updateTodoStatus(TodosModel todosModel, UpdateTodoStatusAction action) {
  //update completed and incomplete todos list

  return todosModel.rebuild((model) {
    if (action.isComplete ?? false) {
      model.completedTodos
        ..add(action.id)
        ..sort();
      model.incompleteTodos.remove(action.id);
    } else {
      model.completedTodos.remove(action.id);
      model.incompleteTodos
        ..add(action.id)
        ..sort();
    }
    return model
      ..todos.updateValue(action.id, (todo) => todo.rebuild((todo) => todo.isCompleted = action.isComplete ?? false));
  });
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

TodosModel _editTodo(TodosModel todosModel, EditTodoAction action) {
  if (action.note.isEmpty) return todosModel;
  if (!todosModel.todos.containsKey(action.id)) return todosModel;
  return todosModel.rebuild(
      (model) => model..todos.updateValue(action.id, (todo) => todo.rebuild((todo) => todo..note = action.note)));
}

TodosModel _deleteTodo(TodosModel todosModel, DeleteTodoAction action) {
  var todo = todosModel.todos[action.id];
  if (todo == null) return todosModel;
  return todosModel.rebuild((model) {
    if (todo.isCompleted) {
      model.completedTodos.remove(todo.id);
    } else {
      model.incompleteTodos.remove(todo.id);
    }
    return model..todos.remove(todo.id);
  });
}
