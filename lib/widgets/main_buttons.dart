import 'package:flutter/material.dart';
import '../homepage.dart';

// ignore: must_be_immutable
class MainButtons extends StatelessWidget {
  String text;
  IconData icon;
  MainButtons({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
      backgroundColor: const Color.fromARGB(255, 243, 199, 148),
      icon: Icon(
        icon,
        size: 24.0,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
  }
}
