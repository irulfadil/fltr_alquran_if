// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../../../../theme/custom_theme.dart';
import '../../../../utils/color_system.dart';
import '../../../data/db/database_instance.dart';
import '../../../data/models/juz_model.dart';
import '../../../data/models/surah_model.dart';

class HomeController extends GetxController {
  RxBool isDark = false.obs;
  List<Juz> allJuz = [];
  final box = GetStorage();

  DatabaseInstance database = DatabaseInstance.instance;

  Future<Map<String, dynamic>?> getLastRead() async {
    Database db = await database.database;

    List<Map<String, dynamic>> dataLastRead = await db.query('bookmark',
        where: 'last_read = 1', orderBy: 'juz, via, surah, ayah');

    if (dataLastRead.isEmpty) {
      return null;
    } else {
      //get data from index 0 => because List still one.
      return dataLastRead.first;
    }
  }

  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await database.database;

    List<Map<String, dynamic>> allBookmark = await db.query('bookmark',
        where: 'last_read = 0', orderBy: 'juz, via, surah, ayah');
    return allBookmark;
  }

  void deletBookmark(int id) async {
    Database db = await database.database;
    await db.delete('bookmark', where: "id = $id");
    update();
    Get.snackbar(
      'Bookmark',
      'Delete data successfully',
      duration: const Duration(seconds: 1),
      colorText: ColorSystem.appColorWhite,
    );
  }

  // toggle theme
  void changeTheme() async {
    print(Get.isDarkMode);
    Get.isDarkMode ? Get.changeTheme(lightMode) : Get.changeTheme(darkMode);
    isDark.toggle();

    // read & remove database in getStore
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

    List<dynamic> data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    List<Surah> results = data.map((e) => Surah.fromJson(e)).toList();
    print("Master Sum: ${results.length}");
    return results;
  }

  // get AllJuz to Tab 'Juz'
  Future<List<Juz>> getAllJuz() async {
    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$i/ar.alafasy");
      var res = await http.get(url);

      Map<String, dynamic> data =
          (jsonDecode(res.body) as Map<String, dynamic>)["data"];

      Juz juz = Juz.fromJson(data);
      allJuz.add(juz);
      // print("allJuz: $allJuz");
    }
    return allJuz;
  }
}
