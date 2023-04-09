import 'package:flutter/material.dart';
import 'package:kemet/screens/login.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/newbackground.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // const LoginPage(),
          const LoginPage(),
        ],
        enableLoop: true,
        fullTransitionValue: 600,
        enableSideReveal: false,
        slideIconWidget: Padding(
          padding: const EdgeInsets.only(right: 10.0, top: 250),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF808080).withOpacity(0.2),
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
