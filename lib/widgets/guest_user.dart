// ignore_for_file: use_build_context_synchronously

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../main.dart';
import 'login_signup_button.dart';

class GuestUser extends StatelessWidget {
  const GuestUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background4.png"),
            fit: BoxFit.cover,
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
                            " Please sign up or log\n in to access this page.",
                            style: TextStyle(
                              fontSize: 28.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'SortsMillGoudy',
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                        LoginSignUpButton(
                          text: 'LogIn/ SignUp',
                          onPressed: () async {
                            final GoogleSignIn googleSignIn = GoogleSignIn();
                            await FirebaseAuth.instance.signOut();
                            await googleSignIn.signOut();
                            navigatorKey.currentState!
                                .pushReplacementNamed('loginPage');
                          },
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
