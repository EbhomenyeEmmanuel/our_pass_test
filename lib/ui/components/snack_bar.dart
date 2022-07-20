import 'package:flutter/material.dart';

class SnackBarLauncher extends StatelessWidget {
  final String error;
  final Function onErrorShown;

  const SnackBarLauncher(
      {Key? key, required this.error, required this.onErrorShown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (error.isNotEmpty) {
      WidgetsBinding.instance?.addPostFrameCallback((_) =>
          _displaySnackBar(context, error: error, onErrorShown: onErrorShown));
    }
    // Placeholder container widget
    return Container();
  }

  void _displaySnackBar(BuildContext context,
      {required String error, required Function onErrorShown}) async {
    final snackBar = SnackBar(content: Text(error));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    await Future.delayed(const Duration(seconds: 2));
    onErrorShown();
  }
}
