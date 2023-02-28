import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/prediction_model.dart';

class Predict {
  Future<PredictionModel> predict(File? image) async {
    final results = PredictionModel(
      gardinerCodePronunciation: '',
      prediction: 'Loading...',
      translation: 'No translation yet...',
    );

    if (image == null) return results;

    //MIU URL
    // var url = "http://192.168.43.162:8000/predict";
    //Bassom's URL
    // var url = "http://192.168.1.3:8000/predict";
    //Reem's URL
    var url = "http://192.168.0.4:8000/predict";
    //Shehab's URL
    // var url = 'http://192.168.1.2:8000/predict';
    //Basma's URL
    // var url = "http://192.168.100.8:8000/predict";
    //DEPLOYMENT SERVER
    // var url = "https://aegyptosflaskapp-2di2bjgsha-ey.a.run.app/predict";

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(
      await http.MultipartFile.fromPath('image', image.path),
    );

    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      final resJson = jsonDecode(response.body);
      final prediction = PredictionModel.fromJson(resJson);
      results.gardinerCodePronunciation = prediction.gardinerCodePronunciation;
      results.prediction = prediction.prediction;
      results.translation = prediction.translation;
    } else {
      print('Failed to make prediction ${response.statusCode}');
      results.prediction = 'Failed to predict';
      results.translation = 'Failed to translate';
    }

    return results;
  }
}
