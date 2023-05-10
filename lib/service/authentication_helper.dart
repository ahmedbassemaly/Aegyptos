import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

bool isGuestUser = false;

void checkGuestUser() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null && user.email == "guest@gmail.com") {
    isGuestUser = true;
  } else {
    isGuestUser = false;
  }
}
