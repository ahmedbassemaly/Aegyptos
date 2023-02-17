// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kemet/widgets/drop_down_language.dart';
import 'service/prediction.dart';
// import 'data/pronunciation_data.dart';
// import 'data/repositories/pronunciation_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  File? _image;
  String prediction = 'Loading...';
  String translation = 'No translation yet...';
  String pronunciation = '';
  final FlutterTts flutterTts = FlutterTts();
  final predict = Predict();
  String? selectedLanguage;
  String? _selectedValue;

  Future getImage(bool isCamera) async {
    XFile? selectedImage;
    if (isCamera) {
      selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      selectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      _image = File(selectedImage!.path);
    }
    setState(() {});
  }

  late Stream<QuerySnapshot<Map<String, dynamic>>>? semanticsStream;
  Future<void> _onPredictPressed() async {
    final results = await predict.predict(_image);

    setState(() {
      prediction = results['prediction'].toString();
      translation = results['translation'].toString();
      pronunciation = results['gardinerCode'].toString();
    });
  }

  speak(String text, String language) async {
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Select Image')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Aegyptos',
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    getImage(false);
                  },
                  icon: const Icon(Icons.image_outlined),
                ),
                const SizedBox(height: 10.2),
                IconButton(
                  onPressed: () {
                    getImage(true);
                  },
                  icon: const Icon(Icons.camera_alt_outlined),
                ),
              ],
            ),
            _image == null
                ? Container()
                : Image.file(
                    _image!,
                    height: 300.0,
                    width: 300.0,
                  ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Text: $prediction',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Translation: $translation',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: _onPredictPressed,
              child: const Text('Predict'),
            ),
            DropdownLanguage(
              onSelectedValueChanged: (String selectedValue) {
                setState(() {
                  _selectedValue = selectedValue;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.volume_up),
              onPressed: () {
                if (_selectedValue == 'English') {
                  selectedLanguage = 'en-US';
                  speak(prediction, selectedLanguage!);
                } else if (_selectedValue == 'Arabic') {
                  selectedLanguage = 'ar-EG';
                  speak(translation, selectedLanguage!);
                } else if (_selectedValue == 'Hieroglyphics') {
                  selectedLanguage = 'ar-EG';
                  speak(pronunciation, selectedLanguage!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
