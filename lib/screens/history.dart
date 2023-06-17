import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/constants.dart';
import '../data/repositories/history_provider.dart';
import '../widgets/history/delete_history_icon.dart';
import '../widgets/history/history_translation.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
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
              alignment: Alignment.topLeft,
              color: Colors.grey.withOpacity(0.3),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Consumer(
                          builder: (_, ref, __) {
                            return ref.watch(historyDataProvider).when(
                              data: (value) {
                                return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                  ),
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: value.docs.length,
                                  itemBuilder: (context, index) {
                                    return value.docs != null
                                        ? GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) => Dialog(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.6,
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                Image.network(
                                                              value.docs[index]
                                                                  ['imageurl'],
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                const SizedBox(
                                                                    height: 10),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          13.0),
                                                                  child: Text(
                                                                    'English: ${value.docs[index]['english'] ?? "Couldn't load data"}',
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          13.0),
                                                                  child: Text(
                                                                    'Arabic: ${value.docs[index]['arabic'] ?? "Couldn't load data"}',
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(35),
                                              child: Card(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        DeleteHistoryIcon(
                                                            historyId: value
                                                                .docs[index]
                                                                .id),
                                                      ],
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.03),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.33,
                                                        child: value.docs[index]
                                                                    [
                                                                    'imageurl'] !=
                                                                null
                                                            ? Image.network(
                                                                value.docs[
                                                                        index][
                                                                    'imageurl'],
                                                                fit:
                                                                    BoxFit.fill,
                                                              )
                                                            : const Text(
                                                                "Couldn't load image"),
                                                      ),
                                                    ),
                                                    HistoryTranslation(
                                                      language: 'English: ',
                                                      languageTranslation: value
                                                                  .docs[index]
                                                              ['english'] ??
                                                          const Text(
                                                              "Couldn't load data"),
                                                    ),
                                                    HistoryTranslation(
                                                      language: 'Arabic: ',
                                                      languageTranslation: value
                                                                  .docs[index]
                                                              ['arabic'] ??
                                                          const Text(
                                                              "Couldn't load data"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : const Text(
                                            'No saved data',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.red,
                                            ),
                                          );
                                  },
                                );
                              },
                              error: (Object error, StackTrace err) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Couldn't load History...",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              loading: () {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
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
