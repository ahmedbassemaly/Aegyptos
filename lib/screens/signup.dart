// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/user_data.dart';
import '../widgets/check_user_acc.dart';
import '../widgets/input_text_form_field.dart';
import '../widgets/login_signup_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userData = UserData();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  InputTextFormField(
                    hintText: 'Username',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    showText: false,
                    controller: usernameController,
                  ),
                  InputTextFormField(
                    hintText: 'Email',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 15.0),
                    showText: false,
                    controller: emailController,
                  ),
                  InputTextFormField(
                    hintText: 'Password',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    showText: true,
                    controller: passwordController,
                  ),
                  CheckUserAccount(
                    text: "Already have an account?",
                    text1: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, 'loginPage');
                    },
                  ),
                  LoginSignUpButton(
                    text: 'Sign Up',
                    onPressed: () async {
                      //Go back to logIn
                      try {
                        await userData.createUserWithEmailAndPassword(
                            emailController.text, passwordController.text);
                        final createUser = FirebaseAuth.instance.currentUser!;
                        String createUserId = createUser.uid;
                        userData.addUserDetails(
                            createUserId,
                            usernameController.text,
                            emailController.text,
                            passwordController.text,
                            'user');
                        // Navigator.pushNamed(context, 'loginPage');
                        Navigator.pushNamed(context, 'verifyEmailPage');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                  'The account already exists for that email.'),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
