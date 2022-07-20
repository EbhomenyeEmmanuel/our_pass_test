import 'package:flutter/material.dart';

class UiManager extends ChangeNotifier {
  int currentScreen = 0;

  void goToScreen(index) {
    currentScreen = index;
    notifyListeners();
  }

  void goToSignUpScreen() {
    currentScreen = 0;
    notifyListeners();
  }

  void goToLoginScreen() {
    currentScreen = 1;
    notifyListeners();
  }

  void goToMainScreen() {
    currentScreen = 2;
    notifyListeners();
  }
}
