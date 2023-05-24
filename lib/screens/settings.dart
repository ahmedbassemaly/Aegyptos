import 'dart:ui';
import 'package:flutter/material.dart';

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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background4.png"),
            fit: BoxFit.cover,
            //Dark theme?

            // colorFilter: const ColorFilter.mode(
            //   Color.fromARGB(255, 16, 103, 173),
            //   BlendMode.modulate,
            // ),
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
                        const Text(
                          "Settings",
                          style: TextStyle(fontSize: 24),
                        ),
                        ProfileMenuWidget(
                            title: "Dark Mode",
                            icon: Icons.dark_mode,
                            IconColor: Colors.black,
                            onPress: () {}),
                        ProfileMenuWidget(
                            title: "Language",
                            icon: Icons.language,
                            IconColor: Colors.black,
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
