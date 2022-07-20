import 'package:flutter/material.dart';
import 'package:our_pass_test/models/signup_data.dart';

class SignUpProvider extends ChangeNotifier {
  var _isLoading = false;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isLoading() => _isLoading;

  final signUpData = SignUpData();

  void setEmail(String value) {
    signUpData.email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    signUpData.password = value;
    notifyListeners();
  }

  void setUsername(String value) {
    signUpData.username = value;
    notifyListeners();
  }

  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  void validateInputs() async {
    final FormState? form = formKey.currentState;
    if (form == null) return;
    if (!form.validate()) {
      autoValidateMode = AutovalidateMode.onUserInteraction; // Start validating on every change.
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
