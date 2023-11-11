// Api URL: http://api.alquran.cloud/v1/juz
// Get detail surah of alquran

class JuzTranslate {
  int? number;
  List<dynamic>? ayahs;
  Map<String, SurahJuz>? surahs;
  Edition? edition;

  JuzTranslate({
    this.number,
    this.ayahs,
    this.surahs,
    this.edition,
  });

  factory JuzTranslate.fromJson(Map<String, dynamic>? json) => JuzTranslate(
        number: json?["number"],
        ayahs: List<dynamic>.from(json?["ayahs"].map((x) => x)),
        surahs: Map.from(json?["surahs"])
            .map((k, v) => MapEntry<String, SurahJuz>(k, SurahJuz.fromJson(v))),
        edition: Edition.fromJson(json?["edition"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "ayahs": List<dynamic>.from(ayahs!.map((x) => x)),
        "surahs": Map.from(surahs!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "edition": edition!.toJson(),
      };
}

class SurahJuz {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;

  SurahJuz({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
  });

  factory SurahJuz.fromJson(Map<String, dynamic>? json) => SurahJuz(
        number: json?["number"],
        name: json?["name"],
        englishName: json?["englishName"],
        englishNameTranslation: json?["englishNameTranslation"],
        revelationType: json?["revelationType"],
        numberOfAyahs: json?["numberOfAyahs"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "numberOfAyahs": numberOfAyahs,
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
