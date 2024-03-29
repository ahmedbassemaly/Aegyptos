import 'dart:ui';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.3),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009),
                          child: const Text(
                            "Contact Info Coming\n Soon Stay Tuned",
                            style: TextStyle(
                              fontSize: 28.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'SortsMillGoudy',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
