// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_build_context_synchronously
// ignore_for_file: prefer_const_literals_to_create_immutables

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/user_data.dart';
import '../widgets/check_user_acc.dart';
import '../widgets/input_text_form_field.dart';
import '../widgets/login_signup_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final userData = UserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: const AssetImage(
              "assets/images/newbackground.jpg",
            ),
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                // Image.asset('assets/OriginalImage.png',
                //     width: 350, height: 250),
                const SizedBox(
                  height: 300.0,
                ),
                InputTextFormField(
                  hintText: 'Email',
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 35.0),
                  showText: false,
                  controller: emailController,
                ),
                InputTextFormField(
                  hintText: 'Password',
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 5.0),
                  showText: true,
                  controller: passwordController,
                ),
                CheckUserAccount(
                  text: "Don't have an account?",
                  text1: 'Sign Up',
                  onPressed: () {
                    Navigator.pushNamed(context, 'signUpPage');
                  },
                ),
                LoginSignUpButton(
                  text: 'Login',
                  onPressed: () async {
                    try {
                      await userData.signInWithEmailAndPassword(
                          emailController.text, passwordController.text);
                      Navigator.pushNamed(context, 'navigation');
                    } on FirebaseAuthException catch (e) {
                      // print(e);
                      if (e.code == 'user-not-found' ||
                          e.code == 'wrong-password') {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title:
                                const Text('Incorrect username or password!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                ),
                CheckUserAccount(
                  text: "Continue as a",
                  text1: 'Guest',
                  color: const Color(0xffE6E6FA),
                  onPressed: () {
                    Navigator.pushNamed(context, 'navigation');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
