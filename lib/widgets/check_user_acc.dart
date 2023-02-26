// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CheckUserAccount extends StatelessWidget {
  String text;
  String text1;
  final Function()? onPressed;
  CheckUserAccount({
    Key? key,
    required this.text,
    required this.text1,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text1,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ],
    );
  }
}
