import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
// bool _isLoading = false;
  Future getImage(bool isCamera) async {
    var selectedImage;
    if (isCamera) {
      selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      selectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _image = File(selectedImage!.path);
    });
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
              'Kemet',
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
          ],
        ),
      ),
    );
  }
}
