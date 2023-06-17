// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class TranslationText extends StatelessWidget {
  String text;
  FontWeight? fontWeight;
  int? maxLines;
  TextOverflow? overflow;
  Color? fontColor;
  TranslationText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: fontWeight, color: fontColor),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
