// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../data/models/surah_detail_model.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../data/models/surah_detail_translate_model.dart';

class DetailSurahController extends GetxController {
  final player = AudioPlayer();

// get detail surah
  Future<SurahDetail> getSurahDetail(String surahNumb) async {
    Uri url =
        Uri.parse("https://api.alquran.cloud/v1/surah/$surahNumb/ar.alafasy");
    var res = await http.get(url);

    Map<String, dynamic>? data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    SurahDetail detailSurah = SurahDetail.fromJson(data);
    return detailSurah;
  }

// get detail surah translate
  Future<SurahDetailTranslate> getSurahDetailTranslate(String surahNumb) async {
    Uri url =
        Uri.parse("https://api.alquran.cloud/v1/surah/$surahNumb/en.asad");
    var res = await http.get(url);

    Map<String, dynamic>? data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    SurahDetailTranslate detailSurahTranslate =
        SurahDetailTranslate.fromJson(data);

    return detailSurahTranslate;
  }

  //function audio
  void playAudio(String? url) async {
    if (url != null) {
      await player.play(UrlSource(url));
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "URL audio not valid.",
      );
    }
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}
