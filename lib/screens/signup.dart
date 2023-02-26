import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/check_user_acc.dart';
import '../widgets/input_text_form_field.dart';
import '../widgets/login_signup_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  Image.asset('assets/logo1.png', width: 350, height: 250),
                  const SizedBox(
                    height: 25.0,
                  ),
                  InputTextFormField(
                    hintText: 'Username',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    showText: false,
                  ),
                  InputTextFormField(
                    hintText: 'Email',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 15.0),
                    showText: false,
                  ),
                  InputTextFormField(
                    hintText: 'Password',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    showText: true,
                  ),
                  CheckUserAccount(
                    text: "Already have an account?",
                    text1: 'Login',
                    onPressed: () {
                      //goes to the Login page
                      Navigator.pushNamed(context, 'loginPage');
                    },
                  ),
                  LoginSignUpButton(
                    text: 'Sign Up',
                    onPressed: () {
                      //Go back to log in
                      // Navigator.pushNamed(context, 'myScreen');
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
