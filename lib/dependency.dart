import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/dependency.config.dart';
import 'package:todo_app/repository/todo_repository/todo_repository.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);
