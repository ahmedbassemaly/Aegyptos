// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HistoryTranslation extends StatelessWidget {
  String language;
  String languageTranslation;
  HistoryTranslation({
    Key? key,
    required this.language,
    required this.languageTranslation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              language,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              languageTranslation,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
