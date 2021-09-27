import 'package:redux/redux.dart';
import 'package:todo_app/actions/update_tab_action/update_tab_action.dart';
import 'package:todo_app/models/app_tab/app_tab.dart';

final tabReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action) {
  return action.newTab;
}
