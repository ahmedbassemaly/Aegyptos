import 'dart:convert';

SearchModel searchFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.text,
  });
  String text;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        text: json["searchRes"],
      );

  Map<String, dynamic> toJson() => {
        "searchRes": text,
      };
}
