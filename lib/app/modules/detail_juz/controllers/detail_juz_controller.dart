import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/juz_model.dart';

class DetailJuzController extends GetxController {
  // get AllJuz
  Future<Juz> getJuzDetail(String juzNum) async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$juzNum");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    Juz juz = Juz.fromJson(data);
    return juz;
  }
  
  // get AllJuzTranslate
  Future<Juz> getJuzDetailTranslate(String juzNum) async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$juzNum/en.asad");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    Juz juzInTranslate = Juz.fromJson(data);
    return juzInTranslate;
  }
}
