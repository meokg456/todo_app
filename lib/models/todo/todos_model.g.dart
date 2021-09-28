// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TodosModel extends TodosModel {
  @override
  final BuiltMap<int, Todo> todos;
  @override
  final BuiltList<int> completedTodos;
  @override
  final BuiltList<int> incompleteTodos;

  factory _$TodosModel([void Function(TodosModelBuilder)? updates]) =>
      (new TodosModelBuilder()..update(updates)).build();

  _$TodosModel._(
      {required this.todos,
      required this.completedTodos,
      required this.incompleteTodos})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(todos, 'TodosModel', 'todos');
    BuiltValueNullFieldError.checkNotNull(
        completedTodos, 'TodosModel', 'completedTodos');
    BuiltValueNullFieldError.checkNotNull(
        incompleteTodos, 'TodosModel', 'incompleteTodos');
  }

  @override
  TodosModel rebuild(void Function(TodosModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodosModelBuilder toBuilder() => new TodosModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodosModel &&
        todos == other.todos &&
        completedTodos == other.completedTodos &&
        incompleteTodos == other.incompleteTodos;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, todos.hashCode), completedTodos.hashCode),
        incompleteTodos.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodosModel')
          ..add('todos', todos)
          ..add('completedTodos', completedTodos)
          ..add('incompleteTodos', incompleteTodos))
        .toString();
  }
}

class TodosModelBuilder implements Builder<TodosModel, TodosModelBuilder> {
  _$TodosModel? _$v;

  MapBuilder<int, Todo>? _todos;
  MapBuilder<int, Todo> get todos =>
      _$this._todos ??= new MapBuilder<int, Todo>();
  set todos(MapBuilder<int, Todo>? todos) => _$this._todos = todos;

  ListBuilder<int>? _completedTodos;
  ListBuilder<int> get completedTodos =>
      _$this._completedTodos ??= new ListBuilder<int>();
  set completedTodos(ListBuilder<int>? completedTodos) =>
      _$this._completedTodos = completedTodos;

  ListBuilder<int>? _incompleteTodos;
  ListBuilder<int> get incompleteTodos =>
      _$this._incompleteTodos ??= new ListBuilder<int>();
  set incompleteTodos(ListBuilder<int>? incompleteTodos) =>
      _$this._incompleteTodos = incompleteTodos;

  TodosModelBuilder();

  TodosModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _todos = $v.todos.toBuilder();
      _completedTodos = $v.completedTodos.toBuilder();
      _incompleteTodos = $v.incompleteTodos.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodosModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodosModel;
  }

  @override
  void update(void Function(TodosModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TodosModel build() {
    _$TodosModel _$result;
    try {
      _$result = _$v ??
          new _$TodosModel._(
              todos: todos.build(),
              completedTodos: completedTodos.build(),
              incompleteTodos: incompleteTodos.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'todos';
        todos.build();
        _$failedField = 'completedTodos';
        completedTodos.build();
        _$failedField = 'incompleteTodos';
        incompleteTodos.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TodosModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
