import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kemet/screens/camera_screen.dart';
// import '../constants/constants.dart';
import '../data/repositories/user_provider.dart';
import '../widgets/main_buttons.dart';
import 'carousel.dart';

// import 'homepage.dart';

class UserChoice extends StatefulWidget {
  const UserChoice({super.key});

  @override
  State<UserChoice> createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background4.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Consumer(
                builder: (_, ref, __) {
                  return ref.watch(userDataProvider).when(
                    data: (value) {
                      return Center(
                        child: Text(
                          'Welcome, ${value.get('Name')}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                          // textAlign: TextAlign.center
                        ),
                      );
                    },
                    error: (Object error, StackTrace err) {
                      return const Text("Error loading your name");
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    },
                  );
                },
              ),
              // MainButtons(
              //   icon: Icons.cloud_upload_rounded,
              //   text: 'Upload',
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => const HomePage()),
              //     );
              //   },
              // ),
              // MainButtons(
              //   icon: Icons.camera,
              //   text: 'Camera',
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => const CameraScreen()),
              //     );
              //   },
              // ),
              // MainButtons(
              //   icon: Icons.search_rounded,
              //   text: 'Search',
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Want to learn more about ancient Egypt? Swipe left",
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.grey.withOpacity(0.5)),
                    child: Center(
                        child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
