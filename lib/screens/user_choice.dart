import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kemet/screens/camera_screen.dart';
import '../constants/constants.dart';
import '../data/repositories/user_provider.dart';
import '../widgets/main_buttons.dart';
import 'homepage.dart';

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
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Consumer(
            builder: (_, ref, __) {
              return ref.watch(userDataProvider).when(
                data: (value) {
                  return Center(
                    child: Text(
                      'Welcome, ${value.get('Name')}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center
                    ),
                  );
                },
                error: (Object error, StackTrace err) {
                  return const Text("Error loading your name");
                },
                loading: () {
                  return const CircularProgressIndicator();
                },
              );
            },
          ),
          MainButtons(
            icon: Icons.cloud_upload_rounded,
            text: 'Upload',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          MainButtons(
            icon: Icons.camera,
            text: 'Camera',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CameraScreen()),
              );
            },
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
