import 'package:flutter/material.dart';
import 'package:our_pass_test/utils/utils.dart';

import 'custom_text_field.dart';

class CustomEmailTextField extends CustomTextField {
  final Function(String)? onChange;
  final bool isEnabled;

  CustomEmailTextField(
      {Key? key, required this.onChange, required this.isEnabled})
      : super(
            key: key,
            title: "Email",
            hint: 'johndoe@mail.com',
            validator: Utils.validateEmail,
            keyboardType: TextInputType.emailAddress,
            enabled: isEnabled);
}
