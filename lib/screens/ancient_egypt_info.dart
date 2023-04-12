import 'package:flutter/material.dart';

class AncientEgyptInfo extends StatelessWidget {
  const AncientEgyptInfo({
    Key? key,
    required this.items,
  }) : super(key: key);

  final String items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        items,
        style: const TextStyle(
          height: 1.4,
          fontSize: 19,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontFamily: 'SortsMillGoudy',
        ),
      ),
    );
  }
}
