import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kemet/main.dart';
import 'package:kemet/screens/contact.dart';
// import 'package:kemet/screens/edit_pfp.dart';
import 'package:kemet/screens/history.dart';
import 'package:kemet/screens/settings.dart';
import 'package:kemet/screens/update_profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../constants/constants.dart';
import '../data/repositories/user_provider.dart';
import '../service/authentication_helper.dart';
import '../widgets/guest_user.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      checkGuestUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isGuestUser) {
      return const GuestUser();
    } else {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/Background4.png"),
              fit: BoxFit.cover,
              //Dark theme?

              colorFilter: iconDark
                  ? const ColorFilter.mode(
                      Color.fromARGB(255, 16, 103, 173),
                      BlendMode.modulate,
                    )
                  : null,
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
                          Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white),
                                  child: IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black,
                                    onPressed: () {
                                      // PersistentNavBarNavigator.pushNewScreen(
                                      //   context,
                                      //   screen: const EditPFPScreen(),
                                      //   withNavBar: false,
                                      //   pageTransitionAnimation:
                                      //       PageTransitionAnimation.cupertino,
                                      // );
                                    },
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
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: iconDark
                                            ? Colors.white
                                            : Colors.black),
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
                          }),
                          Consumer(builder: (_, ref, __) {
                            return ref.watch(userDataProvider).when(
                              data: (value) {
                                return Center(
                                  child: Text(
                                    "${value.get('Email')}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: iconDark
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                );
                              },
                              error: (Object error, StackTrace err) {
                                return const Text("Error loading your Email");
                              },
                              loading: () {
                                return const CircularProgressIndicator();
                              },
                            );
                          }),
                          SizedBox(
                            // height: 23
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),

                          /// -- BUTTON
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
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
                                  backgroundColor: iconDark
                                      ? ConstantsColors.darkPrimaryColor
                                      : const Color.fromARGB(
                                          255, 238, 191, 138),
                                  side: BorderSide.none,
                                  shape: const StadiumBorder()),
                              child: Text("Edit Profile",
                                  style: TextStyle(
                                      color: iconDark
                                          ? Colors.white
                                          : Colors.black)),
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
                              textColor: iconDark ? Colors.white : Colors.black,
                              IconColor: iconDark ? Colors.white : Colors.black,
                              onPress: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const SettingsScreen(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              }),
                          ProfileMenuWidget(
                              title: "History",
                              icon: Icons.history,
                              textColor: iconDark ? Colors.white : Colors.black,
                              IconColor: iconDark ? Colors.white : Colors.black,
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
                              textColor: iconDark ? Colors.white : Colors.black,
                              IconColor: iconDark ? Colors.white : Colors.black,
                              onPress: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const ContactScreen(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              }),
                          ProfileMenuWidget(
                              title: "Logout",
                              icon: Icons.logout,
                              IconColor: const Color.fromARGB(255, 206, 56, 45),
                              textColor: iconDark ? Colors.white : Colors.black,
                              endIcon: false,
                              onPress: () async {
                                final GoogleSignIn googleSignIn =
                                    GoogleSignIn();
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
}
