// Mocks generated by Mockito 5.0.15 from annotations
// in todo_app/test/todo_middleware_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:built_collection/built_collection.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_app/models/app_state/app_state.dart' as _i8;
import 'package:todo_app/models/todo/todo.dart' as _i3;
import 'package:todo_app/models/todo/todos_state.dart' as _i5;
import 'package:todo_app/repository/todo_repository/todo_repository.dart'
    as _i6;
import 'package:todo_app/services/todo_services/abstract_todo_services.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeAbstractTodoServices_0 extends _i1.Fake
    implements _i2.AbstractTodoServices {}

class _FakeTodo_1 extends _i1.Fake implements _i3.Todo {}

class _FakeBuiltList_2<E> extends _i1.Fake implements _i4.BuiltList<E> {}

class _FakeTodosState_3 extends _i1.Fake implements _i5.TodosState {}

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i6.TodoRepository {
  MockTodoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AbstractTodoServices get services => (super.noSuchMethod(
      Invocation.getter(#services),
      returnValue: _FakeAbstractTodoServices_0()) as _i2.AbstractTodoServices);
  @override
  set services(_i2.AbstractTodoServices? _services) =>
      super.noSuchMethod(Invocation.setter(#services, _services),
          returnValueForMissingStub: null);
  @override
  _i7.Future<_i3.Todo> createTodo(String? note) =>
      (super.noSuchMethod(Invocation.method(#createTodo, [note]),
              returnValue: Future<_i3.Todo>.value(_FakeTodo_1()))
          as _i7.Future<_i3.Todo>);
  @override
  _i7.Future<void> updateTodoStatus(int? id, bool? isCompleted) => (super
      .noSuchMethod(Invocation.method(#updateTodoStatus, [id, isCompleted]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> updateTodoNote(int? id, String? note) =>
      (super.noSuchMethod(Invocation.method(#updateTodoNote, [id, note]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> deleteTodo(int? id) =>
      (super.noSuchMethod(Invocation.method(#deleteTodo, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i4.BuiltList<_i3.Todo>> readTodos() =>
      (super.noSuchMethod(Invocation.method(#readTodos, []),
              returnValue: Future<_i4.BuiltList<_i3.Todo>>.value(
                  _FakeBuiltList_2<_i3.Todo>()))
          as _i7.Future<_i4.BuiltList<_i3.Todo>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AppState].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppState extends _i1.Mock implements _i8.AppState {
  MockAppState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TodosState get todosState =>
      (super.noSuchMethod(Invocation.getter(#todosState),
          returnValue: _FakeTodosState_3()) as _i5.TodosState);
  @override
  set todosState(_i5.TodosState? _todosState) =>
      super.noSuchMethod(Invocation.setter(#todosState, _todosState),
          returnValueForMissingStub: null);
  @override
  bool get isLoading =>
      (super.noSuchMethod(Invocation.getter(#isLoading), returnValue: false)
          as bool);
  @override
  set isLoading(bool? _isLoading) =>
      super.noSuchMethod(Invocation.setter(#isLoading, _isLoading),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
