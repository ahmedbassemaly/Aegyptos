import 'package:flutter/material.dart';
import 'package:kemet/constants/constants.dart';
import '../screens/homepage.dart';

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
      backgroundColor: ConstantsColors.primaryColor,
      icon: Icon(
        icon,
        size: 24.0,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
    );
  }
}
