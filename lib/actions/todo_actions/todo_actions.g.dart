// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_actions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetCreateTodoAction extends SetCreateTodoAction {
  @override
  final Todo todo;

  factory _$SetCreateTodoAction(
          [void Function(SetCreateTodoActionBuilder)? updates]) =>
      (new SetCreateTodoActionBuilder()..update(updates)).build();

  _$SetCreateTodoAction._({required this.todo}) : super._() {
    BuiltValueNullFieldError.checkNotNull(todo, 'SetCreateTodoAction', 'todo');
  }

  @override
  SetCreateTodoAction rebuild(
          void Function(SetCreateTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetCreateTodoActionBuilder toBuilder() =>
      new SetCreateTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetCreateTodoAction && todo == other.todo;
  }

  @override
  int get hashCode {
    return $jf($jc(0, todo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SetCreateTodoAction')
          ..add('todo', todo))
        .toString();
  }
}

class SetCreateTodoActionBuilder
    implements Builder<SetCreateTodoAction, SetCreateTodoActionBuilder> {
  _$SetCreateTodoAction? _$v;

  TodoBuilder? _todo;
  TodoBuilder get todo => _$this._todo ??= new TodoBuilder();
  set todo(TodoBuilder? todo) => _$this._todo = todo;

  SetCreateTodoActionBuilder();

  SetCreateTodoActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _todo = $v.todo.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetCreateTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetCreateTodoAction;
  }

  @override
  void update(void Function(SetCreateTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SetCreateTodoAction build() {
    _$SetCreateTodoAction _$result;
    try {
      _$result = _$v ?? new _$SetCreateTodoAction._(todo: todo.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'todo';
        todo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SetCreateTodoAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DoCreateTodoAction extends DoCreateTodoAction {
  @override
  final String note;

  factory _$DoCreateTodoAction(
          [void Function(DoCreateTodoActionBuilder)? updates]) =>
      (new DoCreateTodoActionBuilder()..update(updates)).build();

  _$DoCreateTodoAction._({required this.note}) : super._() {
    BuiltValueNullFieldError.checkNotNull(note, 'DoCreateTodoAction', 'note');
  }

  @override
  DoCreateTodoAction rebuild(
          void Function(DoCreateTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoCreateTodoActionBuilder toBuilder() =>
      new DoCreateTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoCreateTodoAction && note == other.note;
  }

  @override
  int get hashCode {
    return $jf($jc(0, note.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoCreateTodoAction')
          ..add('note', note))
        .toString();
  }
}

class DoCreateTodoActionBuilder
    implements Builder<DoCreateTodoAction, DoCreateTodoActionBuilder> {
  _$DoCreateTodoAction? _$v;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  DoCreateTodoActionBuilder();

  DoCreateTodoActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoCreateTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoCreateTodoAction;
  }

  @override
  void update(void Function(DoCreateTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoCreateTodoAction build() {
    final _$result = _$v ??
        new _$DoCreateTodoAction._(
            note: BuiltValueNullFieldError.checkNotNull(
                note, 'DoCreateTodoAction', 'note'));
    replace(_$result);
    return _$result;
  }
}

class _$SetDeleteTodoAction extends SetDeleteTodoAction {
  @override
  final int id;

  factory _$SetDeleteTodoAction(
          [void Function(SetDeleteTodoActionBuilder)? updates]) =>
      (new SetDeleteTodoActionBuilder()..update(updates)).build();

  _$SetDeleteTodoAction._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'SetDeleteTodoAction', 'id');
  }

  @override
  SetDeleteTodoAction rebuild(
          void Function(SetDeleteTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetDeleteTodoActionBuilder toBuilder() =>
      new SetDeleteTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetDeleteTodoAction && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SetDeleteTodoAction')..add('id', id))
        .toString();
  }
}

class SetDeleteTodoActionBuilder
    implements Builder<SetDeleteTodoAction, SetDeleteTodoActionBuilder> {
  _$SetDeleteTodoAction? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  SetDeleteTodoActionBuilder();

  SetDeleteTodoActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetDeleteTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetDeleteTodoAction;
  }

  @override
  void update(void Function(SetDeleteTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SetDeleteTodoAction build() {
    final _$result = _$v ??
        new _$SetDeleteTodoAction._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'SetDeleteTodoAction', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$DoDeleteTodoAction extends DoDeleteTodoAction {
  @override
  final int id;

  factory _$DoDeleteTodoAction(
          [void Function(DoDeleteTodoActionBuilder)? updates]) =>
      (new DoDeleteTodoActionBuilder()..update(updates)).build();

  _$DoDeleteTodoAction._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'DoDeleteTodoAction', 'id');
  }

  @override
  DoDeleteTodoAction rebuild(
          void Function(DoDeleteTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoDeleteTodoActionBuilder toBuilder() =>
      new DoDeleteTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoDeleteTodoAction && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoDeleteTodoAction')..add('id', id))
        .toString();
  }
}

class DoDeleteTodoActionBuilder
    implements Builder<DoDeleteTodoAction, DoDeleteTodoActionBuilder> {
  _$DoDeleteTodoAction? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DoDeleteTodoActionBuilder();

  DoDeleteTodoActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoDeleteTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoDeleteTodoAction;
  }

  @override
  void update(void Function(DoDeleteTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoDeleteTodoAction build() {
    final _$result = _$v ??
        new _$DoDeleteTodoAction._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'DoDeleteTodoAction', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$SetEditTodoAction extends SetEditTodoAction {
  @override
  final int id;
  @override
  final String note;

  factory _$SetEditTodoAction(
          [void Function(SetEditTodoActionBuilder)? updates]) =>
      (new SetEditTodoActionBuilder()..update(updates)).build();

  _$SetEditTodoAction._({required this.id, required this.note}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'SetEditTodoAction', 'id');
    BuiltValueNullFieldError.checkNotNull(note, 'SetEditTodoAction', 'note');
  }

  @override
  SetEditTodoAction rebuild(void Function(SetEditTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetEditTodoActionBuilder toBuilder() =>
      new SetEditTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetEditTodoAction && id == other.id && note == other.note;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), note.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SetEditTodoAction')
          ..add('id', id)
          ..add('note', note))
        .toString();
  }
}

class SetEditTodoActionBuilder
    implements Builder<SetEditTodoAction, SetEditTodoActionBuilder> {
  _$SetEditTodoAction? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  SetEditTodoActionBuilder();

  SetEditTodoActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetEditTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetEditTodoAction;
  }

  @override
  void update(void Function(SetEditTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SetEditTodoAction build() {
    final _$result = _$v ??
        new _$SetEditTodoAction._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'SetEditTodoAction', 'id'),
            note: BuiltValueNullFieldError.checkNotNull(
                note, 'SetEditTodoAction', 'note'));
    replace(_$result);
    return _$result;
  }
}

class _$DoEditTodoAction extends DoEditTodoAction {
  @override
  final int id;
  @override
  final String note;

  factory _$DoEditTodoAction(
          [void Function(DoEditTodoActionBuilder)? updates]) =>
      (new DoEditTodoActionBuilder()..update(updates)).build();

  _$DoEditTodoAction._({required this.id, required this.note}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'DoEditTodoAction', 'id');
    BuiltValueNullFieldError.checkNotNull(note, 'DoEditTodoAction', 'note');
  }

  @override
  DoEditTodoAction rebuild(void Function(DoEditTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoEditTodoActionBuilder toBuilder() =>
      new DoEditTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoEditTodoAction && id == other.id && note == other.note;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), note.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoEditTodoAction')
          ..add('id', id)
          ..add('note', note))
        .toString();
  }
}

class DoEditTodoActionBuilder
    implements Builder<DoEditTodoAction, DoEditTodoActionBuilder> {
  _$DoEditTodoAction? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  DoEditTodoActionBuilder();

  DoEditTodoActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoEditTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoEditTodoAction;
  }

  @override
  void update(void Function(DoEditTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoEditTodoAction build() {
    final _$result = _$v ??
        new _$DoEditTodoAction._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'DoEditTodoAction', 'id'),
            note: BuiltValueNullFieldError.checkNotNull(
                note, 'DoEditTodoAction', 'note'));
    replace(_$result);
    return _$result;
  }
}

class _$SetUpdateStatusTodoAction extends SetUpdateStatusTodoAction {
  @override
  final int id;
  @override
  final bool? isComplete;

  factory _$SetUpdateStatusTodoAction(
          [void Function(SetUpdateStatusTodoActionBuilder)? updates]) =>
      (new SetUpdateStatusTodoActionBuilder()..update(updates)).build();

  _$SetUpdateStatusTodoAction._({required this.id, this.isComplete})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, 'SetUpdateStatusTodoAction', 'id');
  }

  @override
  SetUpdateStatusTodoAction rebuild(
          void Function(SetUpdateStatusTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetUpdateStatusTodoActionBuilder toBuilder() =>
      new SetUpdateStatusTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetUpdateStatusTodoAction &&
        id == other.id &&
        isComplete == other.isComplete;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), isComplete.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SetUpdateStatusTodoAction')
          ..add('id', id)
          ..add('isComplete', isComplete))
        .toString();
  }
}

class SetUpdateStatusTodoActionBuilder
    implements
        Builder<SetUpdateStatusTodoAction, SetUpdateStatusTodoActionBuilder> {
  _$SetUpdateStatusTodoAction? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  bool? _isComplete;
  bool? get isComplete => _$this._isComplete;
  set isComplete(bool? isComplete) => _$this._isComplete = isComplete;

  SetUpdateStatusTodoActionBuilder();

  SetUpdateStatusTodoActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _isComplete = $v.isComplete;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetUpdateStatusTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetUpdateStatusTodoAction;
  }

  @override
  void update(void Function(SetUpdateStatusTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SetUpdateStatusTodoAction build() {
    final _$result = _$v ??
        new _$SetUpdateStatusTodoAction._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'SetUpdateStatusTodoAction', 'id'),
            isComplete: isComplete);
    replace(_$result);
    return _$result;
  }
}

class _$DoUpdateStatusTodoAction extends DoUpdateStatusTodoAction {
  @override
  final int id;
  @override
  final bool? isComplete;

  factory _$DoUpdateStatusTodoAction(
          [void Function(DoUpdateStatusTodoActionBuilder)? updates]) =>
      (new DoUpdateStatusTodoActionBuilder()..update(updates)).build();

  _$DoUpdateStatusTodoAction._({required this.id, this.isComplete})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'DoUpdateStatusTodoAction', 'id');
  }

  @override
  DoUpdateStatusTodoAction rebuild(
          void Function(DoUpdateStatusTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoUpdateStatusTodoActionBuilder toBuilder() =>
      new DoUpdateStatusTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoUpdateStatusTodoAction &&
        id == other.id &&
        isComplete == other.isComplete;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), isComplete.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoUpdateStatusTodoAction')
          ..add('id', id)
          ..add('isComplete', isComplete))
        .toString();
  }
}

class DoUpdateStatusTodoActionBuilder
    implements
        Builder<DoUpdateStatusTodoAction, DoUpdateStatusTodoActionBuilder> {
  _$DoUpdateStatusTodoAction? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  bool? _isComplete;
  bool? get isComplete => _$this._isComplete;
  set isComplete(bool? isComplete) => _$this._isComplete = isComplete;

  DoUpdateStatusTodoActionBuilder();

  DoUpdateStatusTodoActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _isComplete = $v.isComplete;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoUpdateStatusTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoUpdateStatusTodoAction;
  }

  @override
  void update(void Function(DoUpdateStatusTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoUpdateStatusTodoAction build() {
    final _$result = _$v ??
        new _$DoUpdateStatusTodoAction._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'DoUpdateStatusTodoAction', 'id'),
            isComplete: isComplete);
    replace(_$result);
    return _$result;
  }
}

class _$SetReadTodoAction extends SetReadTodoAction {
  @override
  final BuiltList<Todo> todos;

  factory _$SetReadTodoAction(
          [void Function(SetReadTodoActionBuilder)? updates]) =>
      (new SetReadTodoActionBuilder()..update(updates)).build();

  _$SetReadTodoAction._({required this.todos}) : super._() {
    BuiltValueNullFieldError.checkNotNull(todos, 'SetReadTodoAction', 'todos');
  }

  @override
  SetReadTodoAction rebuild(void Function(SetReadTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetReadTodoActionBuilder toBuilder() =>
      new SetReadTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetReadTodoAction && todos == other.todos;
  }

  @override
  int get hashCode {
    return $jf($jc(0, todos.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SetReadTodoAction')
          ..add('todos', todos))
        .toString();
  }
}

class SetReadTodoActionBuilder
    implements Builder<SetReadTodoAction, SetReadTodoActionBuilder> {
  _$SetReadTodoAction? _$v;

  ListBuilder<Todo>? _todos;
  ListBuilder<Todo> get todos => _$this._todos ??= new ListBuilder<Todo>();
  set todos(ListBuilder<Todo>? todos) => _$this._todos = todos;

  SetReadTodoActionBuilder();

  SetReadTodoActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _todos = $v.todos.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetReadTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetReadTodoAction;
  }

  @override
  void update(void Function(SetReadTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SetReadTodoAction build() {
    _$SetReadTodoAction _$result;
    try {
      _$result = _$v ?? new _$SetReadTodoAction._(todos: todos.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'todos';
        todos.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SetReadTodoAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SetLoadingTodoAction extends SetLoadingTodoAction {
  factory _$SetLoadingTodoAction(
          [void Function(SetLoadingTodoActionBuilder)? updates]) =>
      (new SetLoadingTodoActionBuilder()..update(updates)).build();

  _$SetLoadingTodoAction._() : super._();

  @override
  SetLoadingTodoAction rebuild(
          void Function(SetLoadingTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetLoadingTodoActionBuilder toBuilder() =>
      new SetLoadingTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetLoadingTodoAction;
  }

  @override
  int get hashCode {
    return 925002202;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SetLoadingTodoAction').toString();
  }
}

class SetLoadingTodoActionBuilder
    implements Builder<SetLoadingTodoAction, SetLoadingTodoActionBuilder> {
  _$SetLoadingTodoAction? _$v;

  SetLoadingTodoActionBuilder();

  @override
  void replace(SetLoadingTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetLoadingTodoAction;
  }

  @override
  void update(void Function(SetLoadingTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SetLoadingTodoAction build() {
    final _$result = _$v ?? new _$SetLoadingTodoAction._();
    replace(_$result);
    return _$result;
  }
}

class _$DoReadTodoAction extends DoReadTodoAction {
  factory _$DoReadTodoAction(
          [void Function(DoReadTodoActionBuilder)? updates]) =>
      (new DoReadTodoActionBuilder()..update(updates)).build();

  _$DoReadTodoAction._() : super._();

  @override
  DoReadTodoAction rebuild(void Function(DoReadTodoActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoReadTodoActionBuilder toBuilder() =>
      new DoReadTodoActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoReadTodoAction;
  }

  @override
  int get hashCode {
    return 588908073;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('DoReadTodoAction').toString();
  }
}

class DoReadTodoActionBuilder
    implements Builder<DoReadTodoAction, DoReadTodoActionBuilder> {
  _$DoReadTodoAction? _$v;

  DoReadTodoActionBuilder();

  @override
  void replace(DoReadTodoAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoReadTodoAction;
  }

  @override
  void update(void Function(DoReadTodoActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoReadTodoAction build() {
    final _$result = _$v ?? new _$DoReadTodoAction._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
