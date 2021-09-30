// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'middlewares/todo_middleware/todo_middleware.dart' as _i5;
import 'repository/todo_repository/todo_repository.dart' as _i3;
import 'services/todo_services/abstract_todo_services.dart' as _i4;
import 'services/todo_services/sqlite_todo_services.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AbstractTodoRepository>(
      () => _i3.TodoRepository(
          get<_i4.AbstractTodoServices>(instanceName: 'SqliteServices')),
      instanceName: 'TodoRepository');
  gh.factory<_i5.TodoMiddleware>(() => _i5.TodoMiddleware(
      get<_i3.AbstractTodoRepository>(instanceName: 'TodoRepository')));
  gh.singletonAsync<_i4.AbstractTodoServices>(() => _i6.SqliteServices.init(),
      instanceName: 'SqliteServices');
  return get;
}
