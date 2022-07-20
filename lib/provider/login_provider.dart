import 'package:flutter/material.dart';
import 'package:our_pass_test/models/login_data.dart';

class LoginProvider extends ChangeNotifier {
  var _isLoading = false;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isLoading() => _isLoading;

  final loginData = LoginData();

  void setEmail(String value) {
    loginData.email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    loginData.password = value;
    notifyListeners();
  }

  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  void validateInputs() async {
    final FormState? form = formKey.currentState;
    if (form == null) return;
    if (!form.validate()) {
      autoValidateMode = AutovalidateMode
          .onUserInteraction; // Start validating on every change.
      notifyListeners();
    } else {
      form.save();
      setIsLoading(true);
      await Future.delayed(const Duration(seconds: 5));
      setIsLoading(false);
      // Navigate to Success Dialog
    }
  }
}
