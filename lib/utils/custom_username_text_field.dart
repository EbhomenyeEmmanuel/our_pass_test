import 'package:flutter/material.dart';
import 'package:our_pass_test/utils/utils.dart';

import 'custom_text_field.dart';

class CustomUsernameTextField extends CustomTextField {
  final Function(String)? onChange;
  final bool isEnabled;

  CustomUsernameTextField(
      {Key? key, required this.onChange, required this.isEnabled})
      : super(
      key: key,
      hint: "John Doe",
      title: "Username",
      validator: Utils.validateUsername,
      enabled: isEnabled);
}