import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../data/models/surah_detail_model.dart';

class DetailSurahController extends GetxController {
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
  Future<SurahDetail> getSurahDetailTranslate(String surahNumb) async {
    Uri url =
        Uri.parse("https://api.alquran.cloud/v1/surah/$surahNumb/en.asad");
    var res = await http.get(url);

    Map<String, dynamic>? data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    SurahDetail detailSurahTranslate = SurahDetail.fromJson(data);

    return detailSurahTranslate;
  }
}
