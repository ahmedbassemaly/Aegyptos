import 'package:flutter/material.dart';
import '../widgets/main_buttons.dart';

class UserChoice extends StatefulWidget {
  const UserChoice({super.key});

  @override
  State<UserChoice> createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Background4.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          MainButtons(
            icon: Icons.cloud_upload_rounded,
            text: 'Upload',
          ),
          MainButtons(
            icon: Icons.camera,
            text: 'Camera',
          ),
          MainButtons(
            icon: Icons.search_rounded,
            text: 'Search',
          ),
        ]),
      ),
    );
  }
}
