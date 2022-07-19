import 'package:our_pass_test/utils/strings_utils.dart';
import 'package:our_pass_test/utils/validator.dart';

class Utils {
  static String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return StringsUtils.fieldReq;
    }
    if (!Validator.isEmailValid(input)) {
      return StringsUtils.emailIsInvalid;
    }
    return null;
  }

  static String? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return StringsUtils.fieldReq;
    }
    if (input.length < 6) {
      return StringsUtils.passwordIsInvalid;
    }
    return null;
  }

  static String? validateUsername(String? input) {
    if (input == null || input.isEmpty) {
      return StringsUtils.fieldReq;
    }
    if (input.length < 6) {
      return StringsUtils.usernameIsInvalid;
    }
    return null;
  }
}
