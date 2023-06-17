// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../service/search.dart';
import '../widgets/check_user_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search = Search();
  dynamic searching = [];
  final searchResult = "";
  final _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
                        Text(
                          "Search for a word",
                          style: TextStyle(
                            color: iconDark ? Colors.white : Colors.black,
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
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    final response = await search
                                        .search(_searchController.text);
                                    setState(() {
                                      searching = response['searchResult'];
                                      isFirstTime = false;
                                    });
                                  }
                                },
                              ),
                              filled: true,
                              hintText: "ex: walk, mouth",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 173, 170, 170)),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none),
                              contentPadding: const EdgeInsets.only(
                                  top: 6.0,
                                  bottom: 7.0,
                                  left: 20.0,
                                  right: 5.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (searching.isEmpty && !isFirstTime)
                          CheckUserSearch(text: 'No match found!!')
                        else if (isFirstTime)
                          CheckUserSearch(text: 'Search...')
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: searching.length,
                            itemBuilder: (BuildContext context, int index) {
                              final result = searching[index];
                              final resultString = result
                                  .toString()
                                  .replaceAll('{', '')
                                  .replaceAll('}', '');
                              return Center(
                                child: Card(
                                  color: Colors.white.withOpacity(0.3),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.grey.withOpacity(0.03),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: SizedBox(
                                    width: 350,
                                    height: 100,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          resultString,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
