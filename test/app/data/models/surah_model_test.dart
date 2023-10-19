// ignore_for_file: avoid_print

import "dart:convert";

import 'package:fltr_alquran_if/app/data/models/surah_detail_model.dart';
import 'package:fltr_alquran_if/app/data/models/surah_model.dart';
import "package:http/http.dart" as http;

void main() async {
  Uri url = Uri.parse("https://api.alquran.cloud/v1/surah");
  var res = await http.get(url);

  // print(res.body);

  //res.body tipe 'string', maka ubah menjadi tipe map
  var data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];
  // print(data);

  // data api berbentuk (raw data) kita akan masukkan ke Model
  Surah surah = Surah.fromJson(data[113]);
  // print(surah.toJson());

  Uri urlAnnas =
      Uri.parse("https://api.alquran.cloud/v1/surah/${surah.number}");
  var surahAnnas = await http.get(urlAnnas);

  var dataAnnas = (jsonDecode(surahAnnas.body) as Map<String, dynamic>)["data"];

  SurahDetail annas = SurahDetail.fromJson(dataAnnas);
  print(annas.name);
}
