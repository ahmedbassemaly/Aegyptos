// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_build_context_synchronously
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kemet/widgets/drop_down_language.dart';
import '../data/history_data.dart';
import '../service/authentication_helper.dart';
import '../service/prediction.dart';
import '../widgets/snackbar.dart';
import '../widgets/translation_text.dart';
import '../widgets/translation.dart';

class Translation extends StatefulWidget {
  final bool isCamera;

  const Translation({Key? key, required this.isCamera}) : super(key: key);
  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  File? _image;
  String? prediction;
  String? translation;
  String gardinerCodePronunciation = '';
  final FlutterTts flutterTts = FlutterTts();
  final predict = Predict();
  String? selectedLanguage;
  String? _selectedValue;
  String downloadURL = '';
  XFile? selectedImage;
  final history = History();

  Future getImage(isCamera) async {
    XFile? selectedImage;
    if (widget.isCamera == true) {
      selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);
      _image = File(selectedImage!.path);
      _cropImage(_image!);
    } else if (widget.isCamera == false) {
      selectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      _image = File(selectedImage!.path);
      _cropImage(_image!);
    }
    setState(() {});
  }

  _cropImage(File picked) async {
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
    _image = cropped;
    final results = await predict.predict(_image);
    setState(() {
      _image = cropped;
      prediction = results.prediction.toString();
      translation = results.translation.toString();
      gardinerCodePronunciation = results.gardinerCodePronunciation.toString();
    });
  }

  speak(String text, String language) async {
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  Future saveImage() async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('images');
    String fileName =
        '${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(100000)}.jpg';
    Reference referenceImageToUpload = referenceDirImage.child(fileName);
    try {
      await referenceImageToUpload.putFile(File(_image!.path));
      downloadURL = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      print(e);
    }
    setState(() {
      _image = File(_image!.path);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      checkGuestUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          // make sure we apply clip it properly
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
                              getImage(false);
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.385,
                              width: MediaQuery.of(context).size.width * 0.76,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color:
                                      const Color.fromARGB(213, 243, 243, 232)),
                              child: widget.isCamera
                                  ? buildCameraUI()
                                  : buildUploadUI(),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              getImage(false);
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.385,
                              width: MediaQuery.of(context).size.width * 0.76,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            prediction != null
                                ? Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 35, right: 10),
                                          child: TranslationText(
                                            text: 'English: ',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Flexible(
                                          child: Stack(children: [
                                            TranslationText(text: prediction!),
                                            if (_image != null &&
                                                prediction == null)
                                              const CircularProgressIndicator(
                                                backgroundColor: Colors.grey,
                                              ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            translation != null
                                ? Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 35, right: 10),
                                          child: TranslationText(
                                            text: 'Arabic: ',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        translation != null
                                            ? Flexible(
                                                child: TranslationText(
                                                    text: translation!))
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.14,
                      ),
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_image == null) {
                              showSnackBar(context, Icons.cancel_outlined,
                                  Colors.red, 'Please upload an image');
                              return;
                            } else if (prediction == null ||
                                translation == null) {
                              showSnackBar(context, Icons.cancel_outlined,
                                  Colors.red, 'Please wait a few moments');
                              return;
                            }
                            if (isGuestUser) {
                              return showSnackBar(
                                  context,
                                  Icons.cancel_outlined,
                                  Colors.red,
                                  'Please login/ register first');
                            } else {
                              await saveImage();
                              final user = FirebaseAuth.instance.currentUser!;
                              String userId = user.uid;
                              history.addHistory(
                                userId,
                                downloadURL,
                                prediction!,
                                translation!,
                              );
                              showSnackBar(
                                  context,
                                  Icons.check_circle_outline_rounded,
                                  Colors.green,
                                  'Saved successfully!');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 218, 211, 211)
                                      .withOpacity(0.1),
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.save, color: Colors.black, size: 22),
                              SizedBox(width: 8),
                              Text(
                                'Save',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
