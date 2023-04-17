import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kemet/data/user_data.dart';

import '../widgets/input_text_form_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreen();
}

class _UpdateProfileScreen extends State<UpdateProfileScreen> {
  UserData user = UserData();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Background4.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey.withOpacity(0.3),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          // -- IMAGE with ICON
                          Stack(
                            children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: const Image(
                                        image: AssetImage(
                                            "assets/images/OriginalImage.png"))),
                              ),
                            ],
                          ),

                          // -- Form Fields
                          Form(
                            child: Column(
                              children: [
                                InputTextFormField(
                                  hintText: 'Name',
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 25.0),
                                  showText: false,
                                  controller: nameController,
                                ),
                                InputTextFormField(
                                  hintText: 'Email',
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 25.0),
                                  showText: false,
                                  controller: emailController,
                                ),
                                InputTextFormField(
                                  hintText: 'Phone',
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 25.0),
                                  showText: false,
                                  controller: null,
                                ),
                                InputTextFormField(
                                  hintText: 'Password',
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 25.0),
                                  showText: true,
                                  controller: passwordController,
                                ),
                                const SizedBox(height: 24),

                                // -- Form Submit Button
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await user.editUserDetails(
                                          nameController.text,
                                          emailController.text,
                                          passwordController.text);
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                              'Inforamtion Updated Successfully'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        side: BorderSide.none,
                                        shape: const StadiumBorder()),
                                    child: const Text("Save",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // -- Created Date and Delete Button
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text.rich(
                                      TextSpan(
                                        text: "Random Date",
                                        style: TextStyle(fontSize: 12),
                                        children: [
                                          TextSpan(
                                              text: "Joined",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12))
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.redAccent.withOpacity(0.1),
                                          elevation: 0,
                                          foregroundColor: Colors.red,
                                          shape: const StadiumBorder(),
                                          side: BorderSide.none),
                                      child: const Text("Delete Account"),
                                    ),
                                  ],
                                )
                              ],
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
      ),
    );
  }
}
