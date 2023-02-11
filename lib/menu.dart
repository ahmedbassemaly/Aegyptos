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
        enableLoop: false,
        fullTransitionValue: 600,
      ),
    );
  }
}
