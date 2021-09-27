import 'package:todo_app/models/app_state/app_state.dart';
import 'package:todo_app/reducers/tab_reducer/tab_reducer.dart';

AppState appStateReducer(AppState appState, action) {
  return AppState(activeTab: tabReducer(appState.activeTab, action));
}
