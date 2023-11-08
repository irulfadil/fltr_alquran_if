import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../theme/custom_theme.dart';
import '../../../data/models/juz_model.dart';
import '../../../data/models/surah_model.dart';

class HomeController extends GetxController {
  RxBool isDark = false.obs;
  final box = GetStorage();

  // toggle theme
  void changeTheme() async {
    Get.isDarkMode ? Get.changeTheme(lightMode) : Get.changeTheme(darkMode);
    isDark.toggle();

    if (Get.isDarkMode) {
      box.remove('darkMode');
    } else {
      box.write('darkMode', true);
    }
  }

  // get allSurah to Tab 'Surah'
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/surah");
    var res = await http.get(url);

    List? data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    if (data == null) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

  // get AllJuz to Tab 'Juz'
  Future<List<Juz>> getAllJuz() async {
    List<Juz> allJuz = [];

    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$i");
      var res = await http.get(url);

      Map<String, dynamic> data =
          (jsonDecode(res.body) as Map<String, dynamic>)["data"];

      Juz juz = Juz.fromJson(data);
      allJuz.add(juz);
    }
    return allJuz;
  }
}
