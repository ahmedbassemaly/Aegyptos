import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kemet/main.dart';
import 'package:kemet/screens/history.dart';
import 'package:kemet/screens/update_profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../data/repositories/user_provider.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        /// -- IMAGE
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                      image: AssetImage(
                                          "assets/images/OriginalImage.png"))),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Consumer(builder: (_, ref, __) {
                          return ref.watch(userDataProvider).when(
                            data: (value) {
                              return Center(
                                  child: Text(
                                "${value.get('Name')}",
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ));
                            },
                            error: (Object error, StackTrace err) {
                              return const Text("Error loading your name");
                            },
                            loading: () {
                              return const CircularProgressIndicator();
                            },
                          );
                        }),
                        Consumer(builder: (_, ref, __) {
                          return ref.watch(userDataProvider).when(
                            data: (value) {
                              return Center(
                                  child: Text(
                                "${value.get('Email')}",
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ));
                            },
                            error: (Object error, StackTrace err) {
                              return const Text("Error loading your Email");
                            },
                            loading: () {
                              return const CircularProgressIndicator();
                            },
                          );
                        }),
                        const SizedBox(height: 23),

                        /// -- BUTTON
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const UpdateProfileScreen(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 238, 191, 138),
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text("Edit Profile",
                                style: TextStyle(color: Colors.black)),
                            // child: const Text(tEditProfile,
                            // style: TextStyle(color: tDarkColor)),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),

                        /// -- MENU
                        ProfileMenuWidget(
                            title: "Settings",
                            icon: Icons.settings,
                            IconColor: Colors.black,
                            onPress: () {}),
                        ProfileMenuWidget(
                            title: "History",
                            icon: Icons.history,
                            IconColor: Colors.black,
                            onPress: () {
                              //Navigate to the saved page
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const History(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            }),
                        ProfileMenuWidget(
                            title: "Contact Information",
                            icon: Icons.phone,
                            IconColor: Colors.black,
                            onPress: () {}),
                        ProfileMenuWidget(
                            title: "Logout",
                            icon: Icons.logout,
                            IconColor: const Color.fromARGB(255, 206, 56, 45),
                            textColor: Colors.black,
                            endIcon: false,
                            onPress: () async {
                              final GoogleSignIn googleSignIn = GoogleSignIn();
                              await FirebaseAuth.instance.signOut();
                              await googleSignIn.signOut();
                              navigatorKey.currentState!
                                  .pushReplacementNamed('loginPage');
                              // await googleSignIn.signOut();
                            }),
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
