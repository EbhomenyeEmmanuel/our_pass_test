import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_pass_test/utils/pallete.dart';


class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool autofocus;
  final bool isImportantField;
  final int lines;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final String? errorText;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter> formatter;
  final Widget? prefix;
  final bool enabled;
  final String? Function(String?)? validator;
  final TextAlign inputTextAlign;

  CustomTextField(
      {Key? key,
      this.title,
      this.hint,
      this.textEditingController,
      this.autofocus = false,
      this.isImportantField = false,
      this.keyboardType = TextInputType.text,
      this.lines = 1,
      this.errorText,
      this.onChange,
      this.onSubmitted,
      this.formatter = const [],
      this.prefix,
      this.enabled = true,
      this.validator,
      this.inputTextAlign = TextAlign.start})
      : super(key: key);

  final outline = OutlineInputBorder(
    borderSide: const BorderSide(color: Palette.dividerColor, width: 1.0),
    borderRadius: BorderRadius.circular(5.0),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // minLines: lines,
      // maxLines: 10,
      textAlign: inputTextAlign,
      enabled: enabled,
      keyboardType: keyboardType,
      inputFormatters: formatter,
      autofocus: autofocus,
      controller: textEditingController,
      obscureText: isImportantField,
      onChanged: onChange,
      onFieldSubmitted: onSubmitted,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefix: prefix,
          hintText: hint,
          labelText: title,
          labelStyle: const TextStyle(
              color: Palette.dividerColor, fontWeight: FontWeight.w500),
          hintStyle: const TextStyle(
            color: Palette.dividerColor,
          ),
          border: outline,
          focusedBorder: outline,
          enabledBorder: outline,
          isDense: true,
          errorText: errorText,
          errorMaxLines: 3),
      validator: validator,
    );
  }
}
