// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data/repositories/user_provider.dart';
import '../main.dart';
import 'carousel.dart';

class UserChoice extends StatefulWidget {
  const UserChoice({Key? key}) : super(key: key);

  @override
  State<UserChoice> createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(children: [
            Consumer(
              builder: (_, ref, __) {
                return ref.watch(userDataProvider).when(
                  data: (value) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          'Welcome, ${value?.get('Name')}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  // handle error and show appropriate message
                  error: (Object error, StackTrace err) {
                    return const Text(
                      "Error",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  // show loading indicator while fetching data
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                );
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              child: CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                  ),
                  items: [
                    MyImageView("assets/images/tree-of-life.jpg",
                        "Unlock the secrets of ancient Egypt"),
                    MyImageView("assets/images/ramessesII temple.jpg",
                        "Discover the language of the pharaohs"),
                    MyImageView("assets/images/tomb2-valley-of-the-kings.jpg",
                        "Translate inscriptions on tombs"),
                    MyImageView("assets/images/luxor-temple.jpg",
                        "Get comprehensive hieroglyphic assistance"),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Want to learn more about ancient Egypt? Swipe left",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    // width: 5,
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        color: Colors.grey.withOpacity(0.5)),
                    child: const Center(
                        child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
