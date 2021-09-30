import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:todo_app/models/todo/todo.dart';

part 'todo_actions.g.dart';

abstract class SetCreateTodoAction implements Built<SetCreateTodoAction, SetCreateTodoActionBuilder> {
  Todo get todo;

  SetCreateTodoAction._();

  factory SetCreateTodoAction([void Function(SetCreateTodoActionBuilder) updates]) = _$SetCreateTodoAction;
}

abstract class DoCreateTodoAction implements Built<DoCreateTodoAction, DoCreateTodoActionBuilder> {
  String get note;

  DoCreateTodoAction._();

  factory DoCreateTodoAction([void Function(DoCreateTodoActionBuilder) updates]) = _$DoCreateTodoAction;
}

abstract class SetDeleteTodoAction implements Built<SetDeleteTodoAction, SetDeleteTodoActionBuilder> {
  int get id;

  SetDeleteTodoAction._();

  factory SetDeleteTodoAction([void Function(SetDeleteTodoActionBuilder) updates]) = _$SetDeleteTodoAction;
}

abstract class DoDeleteTodoAction implements Built<DoDeleteTodoAction, DoDeleteTodoActionBuilder> {
  int get id;

  DoDeleteTodoAction._();

  factory DoDeleteTodoAction([void Function(DoDeleteTodoActionBuilder) updates]) = _$DoDeleteTodoAction;
}

abstract class SetEditTodoAction implements Built<SetEditTodoAction, SetEditTodoActionBuilder> {
  int get id;

  String get note;

  SetEditTodoAction._();

  factory SetEditTodoAction([void Function(SetEditTodoActionBuilder) updates]) = _$SetEditTodoAction;
}

abstract class DoEditTodoAction implements Built<DoEditTodoAction, DoEditTodoActionBuilder> {
  int get id;

  String get note;

  DoEditTodoAction._();

  factory DoEditTodoAction([void Function(DoEditTodoActionBuilder) updates]) = _$DoEditTodoAction;
}

abstract class SetUpdateStatusTodoAction implements Built<SetUpdateStatusTodoAction, SetUpdateStatusTodoActionBuilder> {
  int get id;

  bool? get isComplete;

  SetUpdateStatusTodoAction._();

  factory SetUpdateStatusTodoAction([void Function(SetUpdateStatusTodoActionBuilder) updates]) =
      _$SetUpdateStatusTodoAction;
}

abstract class DoUpdateStatusTodoAction implements Built<DoUpdateStatusTodoAction, DoUpdateStatusTodoActionBuilder> {
  int get id;

  bool? get isComplete;

  DoUpdateStatusTodoAction._();

  factory DoUpdateStatusTodoAction([void Function(DoUpdateStatusTodoActionBuilder) updates]) =
      _$DoUpdateStatusTodoAction;
}

abstract class SetReadTodoAction implements Built<SetReadTodoAction, SetReadTodoActionBuilder> {
  BuiltList<Todo> get todos;

  SetReadTodoAction._();

  factory SetReadTodoAction([void Function(SetReadTodoActionBuilder) updates]) = _$SetReadTodoAction;
}

abstract class SetLoadingTodoAction implements Built<SetLoadingTodoAction, SetLoadingTodoActionBuilder> {
  SetLoadingTodoAction._();

  factory SetLoadingTodoAction([void Function(SetLoadingTodoActionBuilder) updates]) = _$SetLoadingTodoAction;
}

abstract class DoReadTodoAction implements Built<DoReadTodoAction, DoReadTodoActionBuilder> {
  DoReadTodoAction._();

  factory DoReadTodoAction([void Function(DoReadTodoActionBuilder) updates]) = _$DoReadTodoAction;
}
