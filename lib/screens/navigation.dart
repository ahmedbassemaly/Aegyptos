// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kemet/screens/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'info.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final CollectionReference collection1 = firestore.collection('Nefertiti');
final CollectionReference collection2 = firestore.collection('Tutankhamun');
final CollectionReference collection3 = firestore.collection('Rosetta Stone');

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({Key? key}) : super(key: key);

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  late Future<List<DocumentSnapshot>> futureDocs1;
  late Future<List<DocumentSnapshot>> futureDocs2;
  late Future<List<DocumentSnapshot>> futureDocs3;

  @override
  void initState() {
    super.initState();
    futureDocs1 = getRandomDocuments(collection1, 4);
    futureDocs2 = getRandomDocuments(collection2, 4);
    futureDocs3 = getRandomDocuments(collection3, 4);
  }

  Future<List<DocumentSnapshot>> getRandomDocuments(
      CollectionReference collection, int count) async {
    QuerySnapshot snapshot = await collection.get();
    List<DocumentSnapshot> docs = snapshot.docs.toList();
    List<DocumentSnapshot> result = [];
    if (docs.length <= count) {
      result = docs;
    } else {
      Random random = Random();
      while (result.length < count) {
        DocumentSnapshot doc = docs[random.nextInt(docs.length)];
        if (!result.contains(doc)) {
          result.add(doc);
        }
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: Future.wait([futureDocs1, futureDocs2, futureDocs3]),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              List<DocumentSnapshot> docs1 = snapshot.data![0];
              List<DocumentSnapshot> docs2 = snapshot.data![1];
              List<DocumentSnapshot> docs3 = snapshot.data![2];
              return PageView(
                children: <Widget>[
                  const HomePage(),
                  InteractiveSliverAppBarScreen(
                    title: 'Nefertiti',
                    modelPath: 'assets/models/nefertiti.glb',
                    item1: (docs1[0].data() as Map<String, dynamic>)['text']
                        .toString(),
                    item2: (docs1[1].data() as Map<String, dynamic>)['text']
                        .toString(),
                    item3: (docs1[2].data() as Map<String, dynamic>)['text']
                        .toString(),
                    item4: (docs1[3].data() as Map<String, dynamic>)['text']
                        .toString(),
                    path: 'assets/images/1500_int-nefertiti-1205.jpg',
                  ),
                  InteractiveSliverAppBarScreen(
                    title: 'Tutankhamun',
                    modelPath: 'assets/models/tutankhamun_gold_mask.glb',
                    item1: (docs2[0].data() as Map<String, dynamic>)['text']
                        .toString(),
                    item2: (docs2[1].data() as Map<String, dynamic>)['text']
                        .toString(),
                    item3: (docs2[2].data() as Map<String, dynamic>)['text']
                        .toString(),
                    item4: (docs2[3].data() as Map<String, dynamic>)['text']
                        .toString(),
                    path: 'assets/images/tutankhamun.jpg',
                  ),
                  InteractiveSliverAppBarScreen(
                    title: 'Rosetta Stone',
                    modelPath: 'assets/models/rosetta_stone.glb',
                    item1: (docs3[0].data() as Map<String, dynamic>)['text']
                        .toString(),
                    item2: (docs3[1].data() as Map<String, dynamic>)['text']
                        .toString(),
                    item3: (docs3[2].data() as Map<String, dynamic>)['text']
                        .toString(),
                    item4: (docs3[3].data() as Map<String, dynamic>)['text']
                        .toString(),
                    path:
                        'assets/images/rosetta-stone-at-the-british-museum.jpg',
                  ),
                ],
              );
            }));
  }
}
