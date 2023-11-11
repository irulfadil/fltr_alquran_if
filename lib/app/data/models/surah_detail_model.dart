// Api URL: https://api.alquran.cloud/v1/surah/114/ar.alafasy
// Get detail surah of alquran

class SurahDetail {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;
  List<Ayah>? ayahs;
  Edition? edition;

  SurahDetail({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
    this.edition,
  });

  factory SurahDetail.fromJson(Map<String, dynamic>? json) => SurahDetail(
        number: json?["number"],
        name: json?["name"],
        englishName: json?["englishName"],
        englishNameTranslation: json?["englishNameTranslation"],
        revelationType: json?["revelationType"],
        numberOfAyahs: json?["numberOfAyahs"],
        ayahs: List<Ayah>.from(
          json?["ayahs"].map(
            (e) => Ayah.fromJson(e),
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

class Ayah {
  int? number;
  String? audio;
  List<String>? audioSecondary;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  dynamic sajda;
  String? statusAudio;

  Ayah({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
    this.statusAudio = 'stop',
  });

  factory Ayah.fromJson(Map<String, dynamic>? json) => Ayah(
        number: json?["number"],
        audio: json?["audio"],
        audioSecondary:
            List<String>.from(json?["audioSecondary"].map((x) => x)),
        text: json?["text"],
        numberInSurah: json?["numberInSurah"],
        juz: json?["juz"],
        manzil: json?["manzil"],
        page: json?["page"],
        ruku: json?["ruku"],
        hizbQuarter: json?["hizbQuarter"],
        sajda: json?["sajda"],
        // statusAudio: json?["statusAudio"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "audio": audio,
        "audioSecondary": List<dynamic>.from(audioSecondary!.map((x) => x)),
        "text": text,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
        "statusAudio": statusAudio,
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
