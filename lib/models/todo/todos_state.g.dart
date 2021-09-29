// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TodosState extends TodosState {
  @override
  final BuiltMap<int, Todo> todos;
  @override
  final BuiltList<int> completedTodos;
  @override
  final BuiltList<int> incompleteTodos;
  @override
  final bool isLoading;

  factory _$TodosState([void Function(TodosStateBuilder)? updates]) =>
      (new TodosStateBuilder()..update(updates)).build();

  _$TodosState._(
      {required this.todos,
      required this.completedTodos,
      required this.incompleteTodos,
      required this.isLoading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(todos, 'TodosState', 'todos');
    BuiltValueNullFieldError.checkNotNull(
        completedTodos, 'TodosState', 'completedTodos');
    BuiltValueNullFieldError.checkNotNull(
        incompleteTodos, 'TodosState', 'incompleteTodos');
    BuiltValueNullFieldError.checkNotNull(isLoading, 'TodosState', 'isLoading');
  }

  @override
  TodosState rebuild(void Function(TodosStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodosStateBuilder toBuilder() => new TodosStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodosState &&
        todos == other.todos &&
        completedTodos == other.completedTodos &&
        incompleteTodos == other.incompleteTodos &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, todos.hashCode), completedTodos.hashCode),
            incompleteTodos.hashCode),
        isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodosState')
          ..add('todos', todos)
          ..add('completedTodos', completedTodos)
          ..add('incompleteTodos', incompleteTodos)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class TodosStateBuilder implements Builder<TodosState, TodosStateBuilder> {
  _$TodosState? _$v;

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

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  TodosStateBuilder();

  TodosStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _todos = $v.todos.toBuilder();
      _completedTodos = $v.completedTodos.toBuilder();
      _incompleteTodos = $v.incompleteTodos.toBuilder();
      _isLoading = $v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodosState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodosState;
  }

  @override
  void update(void Function(TodosStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TodosState build() {
    _$TodosState _$result;
    try {
      _$result = _$v ??
          new _$TodosState._(
              todos: todos.build(),
              completedTodos: completedTodos.build(),
              incompleteTodos: incompleteTodos.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, 'TodosState', 'isLoading'));
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
            'TodosState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
