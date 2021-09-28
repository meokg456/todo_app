import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Update todo status", () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test("Update todo status", () async {
      var checkbox1 = find.byValueKey("checkbox1");
      await driver.waitFor(checkbox1);
      await driver.tap(checkbox1);

      var checkbox2 = find.byValueKey("checkbox2");
      await driver.waitFor(checkbox2);
      await driver.tap(checkbox2);

      var checkbox5 = find.byValueKey("checkbox5");
      await driver.waitFor(checkbox5);
      await driver.tap(checkbox5);

      var incomplete = find.byValueKey("incomplete");
      await driver.waitFor(incomplete);
      await driver.tap(incomplete);

      checkbox1 = find.byValueKey("checkbox1");
      await driver.waitFor(checkbox1);
      await driver.tap(checkbox1);

      await Future.delayed(Duration(milliseconds: 500));

      var checkbox6 = find.byValueKey("checkbox6");
      await driver.waitFor(checkbox6);
      await driver.tap(checkbox6);

      await Future.delayed(Duration(milliseconds: 500));

      var completed = find.byValueKey("completed");
      await driver.waitFor(completed);
      await driver.tap(completed);

      checkbox6 = find.byValueKey("checkbox6");
      await driver.waitFor(checkbox6);
      await driver.tap(checkbox6);

      await Future.delayed(Duration(milliseconds: 500));

      checkbox5 = find.byValueKey("checkbox5");
      await driver.waitFor(checkbox5);
      await driver.tap(checkbox5);

      await Future.delayed(Duration(milliseconds: 500));

      var todos = find.byValueKey("todos");
      await driver.waitFor(todos);
      await driver.tap(todos);

      await Future.delayed(Duration(seconds: 2));
    });

    test("Create todo", () async {
      var fab = find.byValueKey("create");

      await driver.waitFor(fab);
      await driver.tap(fab);

      var note = find.byValueKey("note");
      await driver.waitFor(note);
      var done = find.byValueKey("done");
      await driver.tap(done);
      await Future.delayed(Duration(milliseconds: 500));
      await driver.enterText("Sleep");
      await Future.delayed(Duration(milliseconds: 500));

      await driver.tap(done);

      await Future.delayed(Duration(milliseconds: 2000));
    });

    test("Edit todo", () async {
      var todo = find.byValueKey("todo1");
      await driver.waitFor(todo);
      await driver.tap(todo);

      await Future.delayed(Duration(milliseconds: 500));

      var edit = find.byValueKey("edit");
      await driver.waitFor(edit);
      await driver.tap(edit);

      await Future.delayed(Duration(milliseconds: 500));

      var note = find.byValueKey("note");
      await driver.waitFor(note);
      await driver.enterText("");

      await Future.delayed(Duration(milliseconds: 500));

      var done = find.byValueKey("done");
      await driver.tap(done);

      await Future.delayed(Duration(milliseconds: 500));

      await driver.enterText("Sleep");
      await Future.delayed(Duration(milliseconds: 500));
      await driver.tap(done);
      await Future.delayed(Duration(milliseconds: 1000));
    });

    test("Delete todo", () async {
      var todo = find.byValueKey("todo2");
      await driver.waitFor(todo);
      await driver.tap(todo);

      await Future.delayed(Duration(milliseconds: 500));

      var delete = find.byValueKey("delete");
      await driver.waitFor(delete);
      await driver.tap(delete);

      await Future.delayed(Duration(milliseconds: 500));

      var no = find.byValueKey("no");
      await driver.waitFor(no);
      await driver.tap(no);

      await Future.delayed(Duration(milliseconds: 500));

      todo = find.byValueKey("todo5");
      await driver.waitFor(todo);
      await driver.tap(todo);

      await Future.delayed(Duration(milliseconds: 500));

      await driver.tap(delete);

      await Future.delayed(Duration(milliseconds: 500));

      var yes = find.byValueKey("yes");
      await driver.waitFor(yes);
      await driver.tap(yes);

      await Future.delayed(Duration(milliseconds: 2000));
    });
  });
}
