// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_build_context_synchronously
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data/repositories/user_provider.dart';
import '../data/user_data.dart';
import '../widgets/check_user_acc.dart';
import '../widgets/continue_google/continue_with_divider.dart';
import '../widgets/continue_google/google_button.dart';
import '../widgets/input_text_form_field.dart';
import '../widgets/login_signup_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required WidgetRef ref});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final userData = UserData();

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  WidgetRef? ref;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    LoginSignUpButton(
                      text: 'Login',
                      onPressed: () async {
                        try {
                          await GoogleSignIn().signOut();
                          await userData.signInWithEmailAndPassword(
                              emailController.text, passwordController.text);
                          ref?.read(userDataProviderRepository.notifier).state =
                              userData.getUserDetails();
                          Navigator.pushNamed(context, 'navBar');
                        } on FirebaseAuthException catch (e) {
                          // print(e);
                          if (e.code == 'user-not-found' ||
                              e.code == 'wrong-password') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                    'Incorrect username or password!'),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ContinueWithDivider(
                      text: 'Or continue with',
                    ),
                    SizedBox(
                      // height: 10,
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    GoogleContinueButton(userData: userData),
                    CheckUserAccount(
                      text: "Not a member?",
                      text1: 'Register Now',
                      onPressed: () {
                        Navigator.pushNamed(context, 'signUpPage');
                      },
                    ),
                    CheckUserAccount(
                      text: "Continue as a",
                      text1: 'Guest',
                      color: const Color(0xffE6E6FA),
                      onPressed: () async {
                        await GoogleSignIn().signOut();
                        await userData.signInWithEmailAndPassword(
                            'guest@gmail.com', 'guest@2001');
                        ref?.read(userDataProviderRepository.notifier).state =
                            userData.getUserDetails();
                        Navigator.pushNamed(context, 'navBar');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPageWrapper extends ConsumerWidget {
  const LoginPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoginPage(ref: ref);
  }
}
