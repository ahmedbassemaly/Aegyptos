// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../data/user_data.dart';
import '../../service/auth_Service.dart';

class GoogleContinueButton extends StatelessWidget {
  const GoogleContinueButton({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            try {
              await AuthService().signInWithGoogle();
              String? userName = FirebaseAuth.instance.currentUser?.displayName;
              String? userEmail = FirebaseAuth.instance.currentUser?.email;
              final googleUser = FirebaseAuth.instance.currentUser!;
              String googleUserId = googleUser.uid;
              await userData.addUserDetails(
                  googleUserId, userName!, userEmail!, '', 'user');
              Navigator.pushNamed(context, 'navBar');
            } catch (e) {
              // Handle the error here
              print('Error signing in with Google: $e');
              // Show an error message or perform any other necessary actions
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.grey[200],
            ),
            child: Image.asset(
              'assets/images/google.png',
              height: 45,
            ),
          ),
        ),
      ],
    );
  }
}
