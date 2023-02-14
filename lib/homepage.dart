import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  String prediction = 'Loading...';
  String translation = 'No translation yet...';

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

  Future predict() async {
    if (_image != null) {
      // print('Yesssssssssssss');
      // var url = "http://10.0.2.2:3000/predict";
      //LOCAL SERVER
      // var url = "http://192.168.1.3:8000/predict";
      //DEPLOYMENT SERVER
      var url = "https://aegyptosflaskapp-2di2bjgsha-ey.a.run.app/predict";
      var request = http.MultipartRequest('POST', Uri.parse(url));
      final headers = {"Content-type": "multipart/form-data"};
      request.files.add(http.MultipartFile(
          'image', _image!.readAsBytes().asStream(), _image!.lengthSync(),
          filename: _image!.path.split('/').last));
      request.headers.addAll(headers);
      final response = await request.send();
      http.Response res = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        // print('Yes eshta8al');
        final resJson = jsonDecode(res.body);
        prediction = resJson['prediction'];
        translation = resJson['translation'];
        // print('hello');
        setState(() {});
      } else {
        // print("Failed to make prediction ${response.statusCode}");
        // print("Image Path: ${_image!.path}");
        prediction = 'Failed to predict';
        translation = 'Failed to translate';
        setState(() {});
      }
    }
    return prediction;
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
              onPressed: predict,
              child: const Text('Predict'),
            ),
          ],
        ),
      ),
    );
  }
}
