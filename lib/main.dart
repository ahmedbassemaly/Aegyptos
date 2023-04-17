import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kemet/screens/login.dart';
import 'package:kemet/screens/navigation.dart';
import 'package:kemet/screens/update_profile.dart';
import 'screens/bottom_navbar.dart';
import 'screens/menu.dart';
import 'screens/signup.dart';
import 'screens/user_choice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: 'myScreen',
        routes: {
          'myScreen': (context) => const MyScreen(),
          'loginPage': (context) => const LoginPageWrapper(),
          'signUpPage': (context) => const SignUpPage(),
          'userChoice': (context) => const UserChoice(),
          'navBar': (context) => const BottomNavBar(),
          'navigation': (context) => const SwipeScreen(),
          'editProfile': (context) => const UpdateProfileScreen(),
        });
  }
}
