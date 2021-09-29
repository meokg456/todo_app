import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:todo_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Todo test", () {
    var todos = ["Wake up", "Do exercises", "Eat breakfast", "Go to school", "Have lunch", "Sleep"];

    testWidgets("Create todo", (tester) async {
      app.main();
      for (int i = 0; i < 6; i++) {
        await tester.pumpAndSettle();

        var fab = find.byKey(Key("create"));
        await tester.tap(fab);
        await tester.pumpAndSettle();

        var note = find.byKey(Key("note"));
        var done = find.byKey(Key("done"));
        await tester.tap(done);
        await tester.pumpAndSettle();

        await tester.enterText(note, todos[i]);
        await tester.pumpAndSettle();

        expect(find.text(todos[i]), findsOneWidget);

        await tester.tap(done);
        await tester.pumpAndSettle();

        expect(find.text(todos[i]), findsOneWidget);
      }
    });

    testWidgets("Update todo status", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      var checkbox1 = find.byKey(Key("checkbox1"));

      await tester.tap(checkbox1);
      await tester.pumpAndSettle();

      expect((checkbox1.evaluate().first.widget as Checkbox).value, true);

      var checkbox2 = find.byKey(Key("checkbox2"));
      await tester.tap(checkbox2);
      await tester.pumpAndSettle();

      expect((checkbox2.evaluate().first.widget as Checkbox).value, true);

      var checkbox5 = find.byKey(Key("checkbox5"));
      await tester.tap(checkbox5);
      await tester.pumpAndSettle();

      expect((checkbox5.evaluate().first.widget as Checkbox).value, true);

      var completed = find.byKey(Key("completed"));

      await tester.tap(completed);
      await tester.pumpAndSettle();

      checkbox1 = find.byKey(Key("checkbox1"));
      await tester.tap(checkbox1);
      await tester.pumpAndSettle();

      expect(checkbox1, findsNothing);

      checkbox5 = find.byKey(Key("checkbox5"));
      await tester.tap(checkbox5);
      await tester.pumpAndSettle();

      expect(checkbox5, findsNothing);

      var incomplete = find.byKey(Key("incomplete"));

      await tester.tap(incomplete);
      await tester.pumpAndSettle();

      checkbox1 = find.byKey(Key("checkbox1"));
      await tester.tap(checkbox1);
      await tester.pumpAndSettle();
      expect(checkbox1, findsNothing);

      var checkbox6 = find.byKey(Key("checkbox6"));

      await tester.tap(checkbox6);
      await tester.pumpAndSettle();
      expect(checkbox6, findsNothing);

      var todos = find.byKey(Key("todos"));

      await tester.tap(todos);
      await tester.pumpAndSettle();
    });

    testWidgets("Edit todo", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      var todo = find.byKey(Key("todo1"));

      await tester.tap(todo);
      await tester.pumpAndSettle();

      var edit = find.byKey(Key("edit"));
      await tester.tap(edit);
      await tester.pumpAndSettle();

      var note = find.byKey(Key("note"));
      await tester.enterText(note, "");
      await tester.pumpAndSettle();

      expect(find.text(""), findsOneWidget);

      var done = find.byKey(Key("done"));
      await tester.tap(done);
      await tester.pumpAndSettle();

      await tester.enterText(note, "Dream");
      await tester.pumpAndSettle();

      expect(find.text("Dream"), findsOneWidget);

      await tester.tap(done);
      await tester.pumpAndSettle();

      expect(find.text("Dream"), findsOneWidget);
    });

    testWidgets("Delete todo", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      var todo = find.byKey(Key("todo2"));
      await tester.tap(todo);
      await tester.pumpAndSettle();

      var delete = find.byKey(Key("delete"));
      await tester.tap(delete);
      await tester.pumpAndSettle();

      var no = find.byKey(Key("no"));
      await tester.tap(no);
      await tester.pumpAndSettle();

      expect(todo, findsOneWidget);

      todo = find.byKey(Key("todo5"));
      await tester.tap(todo);
      await tester.pumpAndSettle();

      await tester.tap(delete);
      await tester.pumpAndSettle();

      var yes = find.byKey(Key("yes"));
      await tester.tap(yes);
      await tester.pumpAndSettle();

      expect(todo, findsNothing);

      await Future.delayed(Duration(seconds: 2));
    });
  });
}
