// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../constants/constants.dart';

class LoginSignUpButton extends StatelessWidget {
  String text;
  final Function()? onPressed;
  LoginSignUpButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ConstantsColors.secondaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
