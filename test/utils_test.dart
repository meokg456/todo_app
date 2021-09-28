import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/utils/validator.dart';

void main() {
  test("Note validator", () {
    expect(null, Validator.validateNote("Note"));
    expect("This field can't be empty", Validator.validateNote(null));
    expect("This field can't be empty", Validator.validateNote(""));
  });
}
