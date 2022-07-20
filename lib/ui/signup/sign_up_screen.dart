import 'package:flutter/material.dart';
import 'package:our_pass_test/provider/SignUpProvider.dart';
import 'package:our_pass_test/utils/util.dart';
import 'package:provider/provider.dart';

import '../../utils/pallete.dart';
import '../login/login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      body: Form(
        key: signUpProvider.formKey,
        autovalidateMode: signUpProvider.autoValidateMode,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Palette.mainTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomUsernameTextField(
                    onChange: (value) {
                      signUpProvider.setUsername(value);
                    },
                    isEnabled: !signUpProvider.isLoading(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomEmailTextField(
                      onChange: (value) {
                        signUpProvider.setEmail(value);
                      },
                      isEnabled: !signUpProvider.isLoading()),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPasswordTextField(
                    onChange: (value) {
                      signUpProvider.setPassword(value);
                    },
                    isEnabled: !signUpProvider.isLoading(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OurPassButton(
                      onPressed: () => {signUpProvider.validateInputs()},
                      buttonText: "Sign Up",
                      isLoading: signUpProvider.isLoading()),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Palette.mainTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }))
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Palette.dividerColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}