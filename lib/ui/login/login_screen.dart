import 'package:flutter/material.dart';
import 'package:our_pass_test/provider/login_provider.dart';
import 'package:our_pass_test/ui/home/home.dart';
import 'package:our_pass_test/utils/custom_email_text_field.dart';
import 'package:our_pass_test/utils/our_pass_button.dart';
import 'package:provider/provider.dart';

import '../../utils/custom_password_text_field.dart';
import '../../utils/pallete.dart';
import '../components/snack_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    if (loginProvider.isEmailVerified && loginProvider.isLoginSuccessful) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Expanded(child: Home());
      }));
    }

    return Scaffold(
      body: Stack(children: [
        Form(
          key: loginProvider.formKey,
          autovalidateMode: loginProvider.autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                        color: Palette.mainTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomEmailTextField(
                      onChange: (value) {
                        loginProvider.setEmail(value);
                      },
                      isEnabled: !loginProvider.isLoading()),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPasswordTextField(
                    onChange: (value) {
                      loginProvider.setPassword(value);
                    },
                    isEnabled: !loginProvider.isLoading(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OurPassButton(
                      onPressed: () {
                        loginProvider.validateInputs();
                      },
                      buttonText: "Login",
                      isLoading: loginProvider.isLoading()),
                ],
              ),
            ),
          ),
        ),
        SnackBarLauncher(
            error: loginProvider.errorMessage,
            onErrorShown: () {
              loginProvider.resetErrorMessage();
            }),
      ]),
    );
  }
}
