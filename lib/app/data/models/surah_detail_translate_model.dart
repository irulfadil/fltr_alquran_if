// Api URL: https://api.alquran.cloud/v1/surah/114/en.asad
// Get detail surah of alquran

class SurahDetailTranslate {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;
  List<AyahTranslate>? ayahs;
  Edition? edition;

  SurahDetailTranslate({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
    this.edition,
  });

  factory SurahDetailTranslate.fromJson(Map<String, dynamic>? json) =>
      SurahDetailTranslate(
        number: json?["number"],
        name: json?["name"],
        englishName: json?["englishName"],
        englishNameTranslation: json?["englishNameTranslation"],
        revelationType: json?["revelationType"],
        numberOfAyahs: json?["numberOfAyahs"],
        ayahs: List<AyahTranslate>.from(
          json?["ayahs"].map(
            (e) => AyahTranslate.fromJson(e),
          ),
        ),
        edition: Edition.fromJson(json?["edition"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "numberOfAyahs": numberOfAyahs,
        "ayahs": List<dynamic>.from(ayahs!.map((x) => x.toJson())),
        "edition": edition!.toJson(),
      };
}

class AyahTranslate {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  dynamic sajda;

  AyahTranslate({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory AyahTranslate.fromJson(Map<String, dynamic>? json) {
    return AyahTranslate(
      number: json?["number"],
      text: json?["text"],
      numberInSurah: json?["numberInSurah"],
      juz: json?["juz"],
      manzil: json?["manzil"],
      page: json?["page"],
      ruku: json?["ruku"],
      sajda: json?["sajda"],
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
      };
}

class Sajda {
  int? id;
  bool? recommended;
  bool? obligatory;

  Sajda({
    this.id,
    this.recommended,
    this.obligatory,
  });

  factory Sajda.fromJson(Map<String, dynamic> json) => Sajda(
        id: json["id"],
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recommended": recommended,
        "obligatory": obligatory,
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

  factory Edition.fromJson(Map<String, dynamic>? json) => Edition(
        identifier: json?["identifier"],
        language: json?["language"],
        name: json?["name"],
        englishName: json?["englishName"],
        format: json?["format"],
        type: json?["type"],
        direction: json?["direction"],
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
