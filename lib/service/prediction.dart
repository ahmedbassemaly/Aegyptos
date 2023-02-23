// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Predict {
  Future<Map<String, String>> predict(File? _image) async {
    Map<String, String> results = {
      'prediction': 'Loading...',
      'translation': 'No translation yet...',
      'gardinerCode': ''
    };

    if (_image != null) {
      // print('Yesssssssssssss');
      // var url = "http://10.0.2.2:3000/predict";
      //LOCAL SERVER
      // // var url = "http://192.168.1.3:8000/predict";
      //Reem's URL
      var url = "http://192.168.0.2:8000/predict";
      //Basma's URL
      // var url = "http://192.168.100.8:8000/predict";
      //DEPLOYMENT SERVER
      // var url = "https://aegyptosflaskapp-2di2bjgsha-ey.a.run.app/predict";
      var request = http.MultipartRequest('POST', Uri.parse(url));
      final headers = {"Content-type": "multipart/form-data"};
      request.files.add(http.MultipartFile(
          'image', _image.readAsBytes().asStream(), _image.lengthSync(),
          filename: _image.path.split('/').last));
      request.headers.addAll(headers);
      final response = await request.send();
      http.Response res = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        // print('Yes eshta8al');
        final resJson = jsonDecode(res.body);
        results['prediction'] = resJson['prediction'].toString();
        results['translation'] = resJson['translation'].toString();
        results['gardinerCode'] = resJson['gardinerCode'].toString();
      } else {
        print("Failed to make prediction ${response.statusCode}");
        results['prediction'] = 'Failed to predict';
        results['translation'] = 'Failed to translate';
        results['gardinerCode'] = 'Failed to get gardiner code';
      }
    }
    return results;
  }
}
