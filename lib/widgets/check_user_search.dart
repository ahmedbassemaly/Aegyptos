
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CheckUserSearch extends StatelessWidget {
  String text;
  CheckUserSearch({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30,
              color: Colors.grey[900],
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}