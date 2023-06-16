import 'dart:convert';
import 'package:http/http.dart' as http;

class Search {
  Future<Map<String, dynamic>> search(String text) async {
    // final results = SearchModel(
    //   text: '',
    // );

    // if (text == null) return results;

    //MIU URL
    // var url = "http://192.168.43.162:8000/predict";
    //Bassom's URL
    // var url = "http://192.168.1.3:8000/search";
    //Reem's URL
    // var url = "http://192.168.0.2:8000/predict";
    //Shehab's URL
    // var url = 'http://192.168.1.5:8000/search';
    //Basma's URL
    // var url = "http://192.168.100.8:8000/predict";
    //DEPLOYMENT SERVER
    // var url = "https://aegyptosflaskapp-2di2bjgsha-ey.a.run.app/predict";
    // var url = "https://aegyptosapp-46hlgdngoq-ey.a.run.app/predict";
    // var url = "https://aegyptos.ey.r.appspot.com/predict";
    //RAILWAY URL
    // var url = "https://solitary-fruit-production.up.railway.app/search";
    //RENDER URL
    var url = "https://aegyptos.onrender.com/search";

    // final request = http.MultipartRequest('POST', Uri.parse(url), body:{'text':text});

    final response = await http.post(Uri.parse(url), body: {'text': text});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      // print(json['searchResult']);
      return json;
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
