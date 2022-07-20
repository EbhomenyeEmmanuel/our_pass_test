import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/firebase/auth_repository.dart';
import '../data/models/login_data.dart';

class LoginProvider extends ChangeNotifier {
  final IAuthRepository _authRepository;

  LoginProvider({required IAuthRepository authRepository})
      : _authRepository = authRepository;

  var _isEmailVerified = false;

  void setIsEmailVerified(bool value) {
    _isEmailVerified = value;
    notifyListeners();
  }

  bool get isEmailVerified => _isEmailVerified;

  var _isLoginSuccessful = false;

  void setIsLoginSuccessful(bool value) {
    _isLoginSuccessful = value;
    notifyListeners();
  }

  bool get isLoginSuccessful => _isLoginSuccessful;

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
      _signIn(loginData.email!, loginData.password!);
      // Navigate to Success Dialog
    }
  }

  void _signIn(String email, String password) async {
    final value = await _authRepository.signIn(email, password);
    print("Value is $value");
    setIsLoading(false);
    value.fold((l) => _onError(l.message), (r) => _onSuccessful(r));
  }

  void _onError(String msg) {
    setIsEmailVerified(false);
  }

  void _onSuccessful(UserCredential userCredential) {
    setIsLoginSuccessful(true);
    setIsEmailVerified(true);
  }
}
