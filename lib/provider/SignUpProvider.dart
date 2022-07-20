import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_pass_test/provider/ui_manager.dart';

import '../data/firebase/auth_repository.dart';
import '../data/models/signup_data.dart';

class SignUpProvider extends ChangeNotifier {
  final IAuthRepository _authRepository;

  SignUpProvider({required IAuthRepository authRepository})
      : _authRepository = authRepository;

  late UiManager? uiManager;

  void update(UiManager uiManager) {
    this.uiManager = uiManager;
  }

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
      autoValidateMode = AutovalidateMode
          .onUserInteraction; // Start validating on every change.
      notifyListeners();
    } else {
      form.save();
      setIsLoading(true);
      await Future.delayed(const Duration(seconds: 5));
      _signUp(signUpData.email!, signUpData.password!);
      // Navigate to Success Dialog
    }
  }

  void _signUp(String email, String password) async {
    var value = await _authRepository.signUp(email, password);
    setIsLoading(false);
    value.fold((l) => _onError(l.message), (r) => _onSuccessful(r));
  }

  void _onError(String msg) {}

  void _onSuccessful(UserCredential userCredential) {

  }
}
