class Validator {
  static bool isEmailValid(String? input) {
    return input != null &&
        input.isNotEmpty &&
        !RegExp(r'\S+@\S+\.\S+').hasMatch(input);
  }
}
