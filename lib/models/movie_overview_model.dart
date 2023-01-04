// To parse this JSON data, do
//
//     final movieOverviewModel = movieOverviewModelFromJson(jsonString);

import 'dart:convert';

MovieOverviewModel movieOverviewModelFromJson(String str) =>
    MovieOverviewModel.fromJson(json.decode(str));

String movieOverviewModelToJson(MovieOverviewModel data) =>
    json.encode(data.toJson());

class MovieOverviewModel {
  MovieOverviewModel({
    required this.id,
    required this.translations,
  });

  int id;
  List translations;

  factory MovieOverviewModel.fromJson(Map<String, dynamic> json) =>
      MovieOverviewModel(
        id: json["id"],
        translations: json["translations"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class TranslationOverview {
  TranslationOverview({
    required this.iso31661,
    required this.iso6391,
    required this.name,
    required this.englishName,
    required this.data,
  });

  String iso31661;
  String iso6391;
  String name;
  String englishName;
  Data data;

  factory TranslationOverview.fromJson(Map<String, dynamic> json) =>
      TranslationOverview(
        iso31661: json["iso_3166_1"],
        iso6391: json["iso_639_1"],
        name: json["name"],
        englishName: json["english_name"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "iso_639_1": iso6391,
        "name": name,
        "english_name": englishName,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.homepage,
    required this.overview,
    required this.runtime,
    required this.tagline,
    required this.title,
  });

  String homepage;
  String overview;
  int runtime;
  String tagline;
  String title;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        homepage: json["homepage"],
        overview: json["overview"],
        runtime: json["runtime"],
        tagline: json["tagline"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "homepage": homepage,
        "overview": overview,
        "runtime": runtime,
        "tagline": tagline,
        "title": title,
      };
}
