import 'package:flutter/material.dart';
import 'package:our_pass_test/ui/signup/sign_up.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, timer) =>
              timer.connectionState == ConnectionState.done
                  ? const SignUpScreen()
                  : const Center(child: CircularProgressIndicator())),
    );
  }
}
