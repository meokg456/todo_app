import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/reducers/todo_reducer/todo_reducer.dart';

AppState appStateReducer(AppState appState, action) {
  return AppState(
    todosState: todosReducer(appState.todosState, action),
  );
}
