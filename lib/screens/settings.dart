import 'dart:ui';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/profile_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/Background4.png"),
            fit: BoxFit.cover,
            //Dark theme?

            colorFilter: iconDark
                ? const ColorFilter.mode(
                    Color.fromARGB(255, 16, 103, 173),
                    BlendMode.modulate,
                  )
                : null,
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        const SizedBox(height: 20),
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 24,
                              color: iconDark ? Colors.white : Colors.black),
                        ),
                        ProfileMenuWidget(
                            title: "Dark Mode",
                            textColor: iconDark ? Colors.white : Colors.black,
                            icon: Icons.dark_mode,
                            IconColor: iconDark ? Colors.white : Colors.black,
                            onPress: () {
                              iconDark = !iconDark;
                              print(iconDark);
                              setState(() {});
                            }),
                        ProfileMenuWidget(
                            title: "Language",
                            textColor: iconDark ? Colors.white : Colors.black,
                            icon: Icons.language,
                            IconColor: iconDark ? Colors.white : Colors.black,
                            onPress: () {}),
                      ])),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
