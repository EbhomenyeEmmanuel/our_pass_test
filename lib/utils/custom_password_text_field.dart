import 'package:flutter/material.dart';
import 'package:our_pass_test/utils/utils.dart';

import 'custom_text_field.dart';

class CustomPasswordTextField extends CustomTextField {
  final Function(String)? onChange;
  final bool isEnabled;

  CustomPasswordTextField(
      {Key? key, required this.onChange, required this.isEnabled})
      : super(
      key: key,
      title: "Password",
      hint: '123456',
      validator: Utils.validatePassword,
      enabled: isEnabled);
}