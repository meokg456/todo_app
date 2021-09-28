class Validator {
  static String? validateNote(String? value) {
    return value == null || value.isEmpty ? "This field can't be empty" : null;
  }
}
