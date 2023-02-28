import 'dart:convert';

PredictionModel predictionFromJson(String str) =>
    PredictionModel.fromJson(json.decode(str));

String predictionToJson(PredictionModel data) => json.encode(data.toJson());

class PredictionModel {
  PredictionModel({
    required this.gardinerCodePronunciation,
    required this.prediction,
    required this.translation,
  });

  String gardinerCodePronunciation;
  String prediction;
  String translation;

  factory PredictionModel.fromJson(Map<String, dynamic> json) =>
      PredictionModel(
        gardinerCodePronunciation: json["gardinerCodePronunciation"],
        prediction: json["prediction"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "gardinerCodePronunciation": gardinerCodePronunciation,
        "prediction": prediction,
        "translation": translation,
      };
}
