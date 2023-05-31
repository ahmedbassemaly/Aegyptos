import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

class UserData {
  /// **************************GET USER ROLE**********************************/
  Stream<DocumentSnapshot> getUserDetails() {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userIds)
        .snapshots();
  }

  /// **************************SIGN IN****************************************/
  Future signInWithEmailAndPassword(String email, String password) async {
    final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    ))
        .user;
    if (user != null) {
      userId = user.uid;
    } else {
      print("USER IS NULL");
    }
  }

  /// **************************SIGN UP****************************************/
  Future createUserWithEmailAndPassword(String email, String password) async {
    User? newUser = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    ))
        .user;
  }

  /// **************************ADD USER DETAILS********************************/
  Future addUserDetails(String userId, String userName, String userEmail,
      String userPassword, String userRole) async {
    //2. ADD USER DOC IN "USERS" COLLECTION AND UPDATE THE USER ID*******/
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'id': userId,
      'Name': userName,
      'Email': userEmail,
      'Password': userPassword,
      'userRole': userRole
    });
  }

  /// **************************EDIT USER DETAILS******************************/
  Future editUserDetails(
      String userName, String userEmail, String userPassword) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'Name': userName,
      'Email': userEmail,
      'Password': userPassword,
    });
  }

  /// **************************DELETE USER DETAILS****************************/
  Future deleteAccount() async {
    await FirebaseFirestore.instance.collection('users').doc(userId).delete();
  }

  /// **************************UPDATE USER EMAIL IN FIREBASE******************/
  Future<bool> updateEmail(String? newEmail) async {
    if ((FirebaseAuth.instance.currentUser != null) && (newEmail != null)) {
      try {
        await FirebaseAuth.instance.currentUser!.updateEmail(newEmail);
      } on FirebaseAuthException {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  /// **************************SEND EMAIL VERIFICATION******************/

  Future sendEmailVerification() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException {
      return false;
    }
  }

  /// **************************************************************************/
}
