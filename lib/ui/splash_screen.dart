import 'package:flutter/material.dart';
import 'package:our_pass_test/provider/ui_manager.dart';
import 'package:our_pass_test/ui/home/home.dart';
import 'package:our_pass_test/ui/login/login.dart';
import 'package:our_pass_test/ui/signup/sign_up.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static List<Widget> pages = <Widget>[
    const SignUpScreen(),
    const LoginScreen(),
    const Home(),
    Container(
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final uiManager = Provider.of<UiManager>(context);
    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, timer) =>
              timer.connectionState == ConnectionState.done
                  ? pages[uiManager.currentScreen]
                  : const Center(child: CircularProgressIndicator())),
    );
  }
}
