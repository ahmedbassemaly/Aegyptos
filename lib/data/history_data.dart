import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class History {
  Future addHistory(
      String userId, String imageUrl, String english, String arabic) async {
    await FirebaseFirestore.instance.collection('history').add({
      'userid': userId,
      'imageurl': imageUrl,
      'english': english,
      'arabic': arabic,
    });
  }

  Stream<QuerySnapshot> getUserHistory() {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    return FirebaseFirestore.instance
        .collection('history')
        .where('userid', isEqualTo: userIds)
        .snapshots();
  }

  Future deleteHistory(String historyId) async {
    await FirebaseFirestore.instance
        .collection('history')
        .doc(historyId)
        .delete();
  }
}
