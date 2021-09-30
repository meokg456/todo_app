import 'package:built_collection/built_collection.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/services/todo_services/abstract_todo_services.dart';

@Singleton(as: AbstractTodoServices)
@named
class SqliteServices implements AbstractTodoServices {
  late Database database;

  @factoryMethod
  static Future<SqliteServices> init() async {
    var services = SqliteServices();

    var databasesPath = await getDatabasesPath();
    print(databasesPath);
    String path = join(databasesPath, 'todo.db');

    services.database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Todo (id INTEGER PRIMARY KEY autoincrement, note TEXT not null, isComplete INTEGER not null)');
    });
    return services;
  }

  Future<Todo> createTodo(String note) async {
    int id = await database.insert("Todo", {"note": note, "isComplete": 0});
    return Todo((todo) => todo
      ..id = id
      ..note = note
      ..isCompleted = false);
  }

  Future<void> updateTodoStatus(int id, bool? isCompleted) async {
    await database.update("Todo", {"isComplete": isCompleted ?? false ? 1 : 0}, where: "id = ?", whereArgs: [id]);
  }

  Future<void> updateTodoNote(int id, String note) async {
    await database.update("Todo", {"note": note}, where: "id = ?", whereArgs: [id]);
  }

  Future<void> deleteTodo(int id) async {
    await database.delete("Todo", where: "id = ?", whereArgs: [id]);
  }

  Future<BuiltList<Todo>> readTodoList() async {
    var data = await database.query("Todo");
    print(data);
    return data
        .map((datum) => Todo((todo) => todo
          ..id = datum["id"] as int
          ..note = datum["note"] as String
          ..isCompleted = datum["isComplete"] == 1 ? true : false))
        .toBuiltList();
  }
}
