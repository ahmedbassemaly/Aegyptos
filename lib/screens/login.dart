// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../widgets/check_user_acc.dart';
import '../widgets/input_text_form_field.dart';
import '../widgets/login_signup_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              "assets/Background4.png",
            ),
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset('assets/logo1.png', width: 350, height: 300),
                InputTextFormField(
                  hintText: 'Email',
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 35.0),
                  showText: false,
                ),
                InputTextFormField(
                  hintText: 'Password',
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 5.0),
                  showText: true,
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
                  onPressed: () {
                    Navigator.pushNamed(context, 'userChoice');
                  },
                ),
                CheckUserAccount(
                  text: "Continue as a",
                  text1: 'Guest',
                  color: const Color(0xffE6E6FA),
                  onPressed: () {
                    Navigator.pushNamed(context, 'userChoice');
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
