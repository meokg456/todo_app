import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/actions/todo_actions/todo_actions.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/models/todo/todos_state.dart';

final todosReducer = combineReducers<TodosState>([
  TypedReducer(_updateTodoStatus),
  TypedReducer(_createTodo),
  TypedReducer(_editTodo),
  TypedReducer(_deleteTodo),
  TypedReducer(_readTodos),
  TypedReducer(_startLoadTodos),
]);

TodosState _updateTodoStatus(TodosState todosState, SetUpdateStatusTodoAction action) {
  //update completed and incomplete todos list
  return todosState.rebuild((model) {
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

TodosState _createTodo(TodosState todosState, SetCreateTodoAction action) {
  if (action.note.isEmpty) return todosState;
  int id = todosState.todos.length + 1;
  return todosState.rebuild((model) => model
    ..todos[id] = Todo((todo) => todo
      ..note = action.note
      ..isCompleted = false
      ..id = id)
    ..incompleteTodos.add(id));
}

TodosState _editTodo(TodosState todosState, SetEditTodoAction action) {
  if (action.note.isEmpty) return todosState;
  if (!todosState.todos.containsKey(action.id)) return todosState;
  return todosState.rebuild(
      (model) => model..todos.updateValue(action.id, (todo) => todo.rebuild((todo) => todo..note = action.note)));
}

TodosState _readTodos(TodosState todosState, SetReadTodoAction action) {
  return todosState.rebuild((todosState) {
    action.todos.forEach((todo) {
      todosState.todos[todo.id] = todo;
      if (todo.isCompleted) {
        todosState.completedTodos.add(todo.id);
      } else {
        todosState.incompleteTodos.add(todo.id);
      }
    });
    return todosState..isLoading = false;
  });
}

TodosState _startLoadTodos(TodosState todosState, SetLoadingTodoAction action) {
  return todosState.rebuild((todosState) => todosState..isLoading = true);
}

TodosState _deleteTodo(TodosState todosState, SetDeleteTodoAction action) {
  var todo = todosState.todos[action.id];
  if (todo == null) return todosState;
  return todosState.rebuild((model) {
    if (todo.isCompleted) {
      model.completedTodos.remove(todo.id);
    } else {
      model.incompleteTodos.remove(todo.id);
    }
    return model..todos.remove(todo.id);
  });
}
