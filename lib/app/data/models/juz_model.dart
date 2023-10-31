// Api URL: http://api.alquran.cloud/v1/juz
// Get detail surah of alquran

import 'surah_model.dart';

class Juz {
  int? number;
  List<dynamic>? ayahs;
  Map<String, Surah>? surahs;
  Edition? edition;

  Juz({
    this.number,
    this.ayahs,
    this.surahs,
    this.edition,
  });

  factory Juz.fromJson(Map<String, dynamic> json) => Juz(
        number: json["number"],
        ayahs: List<dynamic>.from(json["ayahs"].map((x) => x)),
        surahs: Map.from(json["surahs"])
            .map((k, v) => MapEntry<String, Surah>(k, Surah.fromJson(v))),
        edition: Edition.fromJson(json["edition"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "ayahs": List<dynamic>.from(ayahs!.map((x) => x)),
        "surahs": Map.from(surahs!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "edition": edition!.toJson(),
      };
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"],
        language: json["language"],
        name: json["name"],
        englishName: json["englishName"],
        format: json["format"],
        type: json["type"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "language": language,
        "name": name,
        "englishName": englishName,
        "format": format,
        "type": type,
        "direction": direction,
      };
}

// class Surah {
//   int? number;
//   String? name;
//   String? englishName;
//   String? englishNameTranslation;
//   String? revelationType;
//   int? numberOfAyahs;

//   Surah({
//     this.number,
//     this.name,
//     this.englishName,
//     this.englishNameTranslation,
//     this.revelationType,
//     this.numberOfAyahs,
//   });

//   factory Surah.fromJson(Map<String, dynamic> json) => Surah(
//         number: json["number"],
//         name: json["name"],
//         englishName: json["englishName"],
//         englishNameTranslation: json["englishNameTranslation"],
//         revelationType: json["revelationType"],
//         numberOfAyahs: json["numberOfAyahs"],
//       );

//   Map<String, dynamic> toJson() => {
//         "number": number,
//         "name": name,
//         "englishName": englishName,
//         "englishNameTranslation": englishNameTranslation,
//         "revelationType": revelationType,
//         "numberOfAyahs": numberOfAyahs,
//       };
// }
