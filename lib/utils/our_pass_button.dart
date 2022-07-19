import 'package:flutter/material.dart';
import 'package:our_pass_test/utils/pallete.dart';

class OurPassButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final bool isLoading;
  final bool isEnabled;

  const OurPassButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      required this.isLoading,
      this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(isEnabled
                ? Palette.mainColor
                : Palette.mainColor.withOpacity(0.4)),
            minimumSize: MaterialStateProperty.all(Size(screenSize.width, 50))),
        onPressed: () => !isEnabled
            ? null
            : isLoading
                ? null
                : onPressed(),
        child: Visibility(
            visible: isLoading,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 40,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            replacement: Text(buttonText.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))));
  }
}
