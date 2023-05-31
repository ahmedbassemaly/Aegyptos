import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kemet/screens/login.dart';
import 'package:kemet/screens/navigation.dart';
import 'package:kemet/screens/no_internet_connection.dart';
import 'package:kemet/screens/update_profile.dart';
import 'screens/bottom_navbar.dart';
import 'screens/history.dart';
import 'screens/menu.dart';
import 'screens/signup.dart';
import 'screens/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/verify_email_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == ConnectivityResult.none) {
                return const InternetConnection();
              } else {
                return const MyScreen();
              }
            } else {
              return const InternetConnection();
            }
          },
        ),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        // initialRoute: 'myScreen',
        routes: {
          'myScreen': (context) => const MyScreen(),
          'loginPage': (context) => const LoginPageWrapper(),
          'signUpPage': (context) => const SignUpPage(),
          'userChoice': (context) => const HomePage(),
          'navBar': (context) => const BottomNavBar(),
          'navigation': (context) => const SwipeScreen(),
          'editProfile': (context) => const UpdateProfileScreen(),
          'history': (context) => const History(),
          'verifyEmailPage': (context) => const VerifyEmailPage(),
        });
  }
}
