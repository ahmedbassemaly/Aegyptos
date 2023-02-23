import 'package:flutter/material.dart';
import 'package:kemet/widgets/main_buttons.dart';
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
                image: AssetImage("assets/newBackground2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background4.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
          ),
        ],
        enableLoop: true,
        fullTransitionValue: 600,
        enableSideReveal: true,
        slideIconWidget: Padding(
          padding: const EdgeInsets.only(right: 10.0),
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
