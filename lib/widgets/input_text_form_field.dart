// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  String hintText;
  EdgeInsetsGeometry padding;
  bool showText;
  final TextEditingController? controller;
  InputTextFormField({
    Key? key,
    required this.hintText,
    required this.padding,
    required this.showText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: showText,
        // validator: validateEmail,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.transparent),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
