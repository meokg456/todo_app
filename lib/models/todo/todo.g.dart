// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Todo extends Todo {
  @override
  final int id;
  @override
  final String note;
  @override
  final bool isCompleted;

  factory _$Todo([void Function(TodoBuilder)? updates]) =>
      (new TodoBuilder()..update(updates)).build();

  _$Todo._({required this.id, required this.note, required this.isCompleted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Todo', 'id');
    BuiltValueNullFieldError.checkNotNull(note, 'Todo', 'note');
    BuiltValueNullFieldError.checkNotNull(isCompleted, 'Todo', 'isCompleted');
  }

  @override
  Todo rebuild(void Function(TodoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoBuilder toBuilder() => new TodoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
        id == other.id &&
        note == other.note &&
        isCompleted == other.isCompleted;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), note.hashCode), isCompleted.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Todo')
          ..add('id', id)
          ..add('note', note)
          ..add('isCompleted', isCompleted))
        .toString();
  }
}

class TodoBuilder implements Builder<Todo, TodoBuilder> {
  _$Todo? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  bool? _isCompleted;
  bool? get isCompleted => _$this._isCompleted;
  set isCompleted(bool? isCompleted) => _$this._isCompleted = isCompleted;

  TodoBuilder();

  TodoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _note = $v.note;
      _isCompleted = $v.isCompleted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Todo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Todo;
  }

  @override
  void update(void Function(TodoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Todo build() {
    final _$result = _$v ??
        new _$Todo._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'Todo', 'id'),
            note: BuiltValueNullFieldError.checkNotNull(note, 'Todo', 'note'),
            isCompleted: BuiltValueNullFieldError.checkNotNull(
                isCompleted, 'Todo', 'isCompleted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
