import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Update todo status", () {
    late FlutterDriver driver;
    var todos = ["Wake up", "Do exercises", "Eat breakfast", "Go to school", "Have lunch", "Sleep"];
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test("Create todo", () async {
      var loading = find.byValueKey("load");
      driver.waitForAbsent(loading);
      for (int i = 0; i < todos.length; i++) {
        var fab = find.byValueKey("create");
        await driver.tap(fab);
        await driver.waitFor(fab);

        var note = find.byValueKey("note");
        var done = find.byValueKey("done");
        await driver.tap(done);
        await driver.waitFor(note);
        await driver.waitFor(done);

        await driver.enterText(todos[i]);
        await driver.waitFor(note);

        await driver.tap(done);
      }
    });

    test("Update todo status", () async {
      var checkbox1 = find.byValueKey("checkbox1");
      await driver.tap(checkbox1);
      await driver.waitFor(checkbox1);

      var checkbox2 = find.byValueKey("checkbox2");
      await driver.tap(checkbox2);
      await driver.waitFor(checkbox2);

      var checkbox5 = find.byValueKey("checkbox5");
      await driver.tap(checkbox5);
      await driver.waitFor(checkbox5);

      var incomplete = find.byValueKey("incomplete");
      await driver.tap(incomplete);
      await driver.waitFor(incomplete);

      checkbox1 = find.byValueKey("checkbox3");
      await driver.tap(checkbox1);

      var checkbox6 = find.byValueKey("checkbox6");
      await driver.tap(checkbox6);

      var completed = find.byValueKey("completed");
      await driver.tap(completed);
      await driver.waitFor(completed);

      checkbox6 = find.byValueKey("checkbox6");
      await driver.tap(checkbox6);

      checkbox5 = find.byValueKey("checkbox5");
      await driver.tap(checkbox5);

      var todos = find.byValueKey("todos");
      await driver.tap(todos);
      await driver.waitFor(todos);
    });

    test("Edit todo", () async {
      var todo = find.byValueKey("todo1");
      await driver.tap(todo);
      await driver.waitFor(todo);

      var edit = find.byValueKey("edit");
      await driver.tap(edit);
      await driver.waitFor(edit);

      var note = find.byValueKey("note");
      await driver.enterText("");
      await driver.waitFor(note);

      var done = find.byValueKey("done");
      await driver.tap(done);
      await driver.waitFor(done);

      await driver.enterText("Sleep");
      await driver.waitFor(note);

      await driver.tap(done);
    });

    test("Delete todo", () async {
      var todo = find.byValueKey("todo2");
      await driver.tap(todo);
      await driver.waitFor(todo);

      var delete = find.byValueKey("delete");
      await driver.tap(delete);
      await driver.waitFor(delete);

      var no = find.byValueKey("no");
      await driver.tap(no);

      todo = find.byValueKey("todo5");
      await driver.tap(todo);
      await driver.waitFor(todo);

      await driver.tap(delete);
      await driver.waitFor(delete);

      var yes = find.byValueKey("yes");
      await driver.tap(yes);
    });
  });
}
