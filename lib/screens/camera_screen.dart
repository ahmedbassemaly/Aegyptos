import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/constants.dart';
import '../service/prediction.dart';
import '../widgets/drop_down_language.dart';
import '../widgets/translation_text.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;
  String? prediction;
  String? translation;
  String gardinerCodePronunciation = '';
  final FlutterTts flutterTts = FlutterTts();
  final predict = Predict();
  String? selectedLanguage;
  String? _selectedValue;

  Future getImage(bool isCamera) async {
    XFile selectedImage;
    if (isCamera) {
      selectedImage =
          (await ImagePicker().pickImage(source: ImageSource.camera))!;
      _image = File(selectedImage.path);
      _cropImage(selectedImage);
    } else {
      selectedImage =
          (await ImagePicker().pickImage(source: ImageSource.gallery))!;
      _image = File(selectedImage.path);
      // _cropImage(selectedImage);
    }
    setState(() {});
  }

  _cropImage(XFile picked) async {
    final results = await predict.predict(_image);
    File? cropped = await ImageCropper().cropImage(
      androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      setState(() {
        _image = cropped;
        prediction = results.prediction.toString();
        translation = results.translation.toString();
        gardinerCodePronunciation =
            results.gardinerCodePronunciation.toString();
      });
    }
  }

  // late Stream<QuerySnapshot<Map<String, dynamic>>>? semanticsStream;
  // Future<void> _onPredictPressed() async {
  //   final results = await predict.predict(_image);

  //   setState(() {
  //     prediction = results.prediction.toString();
  //     translation = results.translation.toString();
  //     gardinerCodePronunciation = results.gardinerCodePronunciation.toString();
  //   });
  // }

  speak(String text, String language) async {
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Background4.png"),
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
                child: Column(
                  children: [
                    _image == null
                        ? GestureDetector(
                            onTap: () {
                              getImage(true);
                            },
                            child: _image == null
                                ? Container(
                                    height: 300.0,
                                    width: 300.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: const Color.fromARGB(
                                            213, 243, 243, 232)),
                                    child: Center(
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 100,
                                        color: ConstantsColors.secondaryColor,
                                      ),
                                    ),
                                  )
                                : Image.file(
                                    _image!,
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                          )
                        : GestureDetector(
                            onTap: () {
                              getImage(true);
                            },
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            prediction != null
                                ? Row(
                                    children: [
                                      TranslationText(
                                        text: 'English: ',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      prediction != null
                                          ? TranslationText(text: prediction!)
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      // TranslationText(text: prediction!),
                                    ],
                                  )
                                : Container(),
                            // TranslationText(
                            //     text: 'Translation: ',
                            //     fontWeight: FontWeight.bold),
                            // TranslationText(text: prediction),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            translation != null
                                ? Row(
                                    children: [
                                      TranslationText(
                                        text: 'Arabic: ',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      translation != null
                                          ? TranslationText(text: translation!)
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      // TranslationText(text: translation!),
                                    ],
                                  )
                                : Container(),
                            // TranslationText(
                            //   text: 'Arabic: ',
                            //   fontWeight: FontWeight.bold,
                            // ),
                            // TranslationText(text: translation),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                    // ElevatedButton(
                    //   onPressed: _onPredictPressed,
                    //   style: ElevatedButton.styleFrom(
                    //       backgroundColor: ConstantsColors.secondaryColor,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10.0))),
                    //   child: const Text(
                    //     'Get Translation!',
                    //     style: TextStyle(color: Colors.white, fontSize: 17),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownLanguage(
                            onSelectedValueChanged: (String selectedValue) {
                              setState(() {
                                _selectedValue = selectedValue;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.volume_up),
                            color: Colors.white,
                            iconSize: 35,
                            onPressed: () {
                              if (_selectedValue == 'English') {
                                selectedLanguage = 'en-US';
                                speak(prediction!, selectedLanguage!);
                              } else if (_selectedValue == 'Arabic') {
                                selectedLanguage = 'ar-EG';
                                speak(translation!, selectedLanguage!);
                              } else if (_selectedValue == 'Hieroglyphics') {
                                selectedLanguage = 'ar-EG';
                                speak(gardinerCodePronunciation,
                                    selectedLanguage!);
                              }
                            },
                          ),
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
    );
  }
}
