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
import '../service/search.dart';
import '../widgets/profile_widget.dart';
import '../models/search_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search = Search();
  String? searching;
  final searchResult = "";
  final _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background4.png"),
            fit: BoxFit.cover,
            //Dark theme?

            // colorFilter: const ColorFilter.mode(
            //   Color.fromARGB(255, 16, 103, 173),
            //   BlendMode.modulate,
            // ),
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        const Text(
                          "Search for a word",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                } else {
                                  return null;
                                }
                              },
                              controller: _searchController,
                              decoration: InputDecoration(
                                  suffix: IconButton(
                                    icon: const Icon(Icons.search),
                                    onPressed: () async {
                                      // final result =
                                      //     await search.search(searching!);
                                      // setState(() {
                                      //   searching = result.text.toString();
                                      // });
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );
                                        final result = await search
                                            .search(_searchController.text);
                                        if (result != null) {
                                          final response = await search
                                              .search(_searchController.text);
                                          setState(() {
                                            searching = response['searchResult']
                                                .toString();
                                          });
                                        } else {
                                          print("kjfhsdkjf");
                                        }
                                      }
                                    },
                                  ),
                                  filled: true,
                                  hintText: "ex: walk, speak",
                                  hintStyle: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 173, 170, 170)),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none))),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Card(
                            color: Colors.white.withOpacity(0.3),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey.withOpacity(0.03),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: SizedBox(
                              width: 300,
                              height: 100,
                              child: Center(
                                  child: Text('$searching',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32))),
                            ),
                          ),
                        ),
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
