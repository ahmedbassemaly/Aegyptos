// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CheckUserAccount extends StatelessWidget {
  String text;
  String text1;
  final Function()? onPressed;
  Color? color;
  CheckUserAccount({
    Key? key,
    required this.text,
    required this.text1,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text1,
            style: TextStyle(
                fontSize: 17, color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
