// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../theme/app_theme.dart';
import '../../../../utils/color_system.dart';
import '../../../data/db/database_instance.dart';
import '../../../data/models/juz_model.dart';
import '../../../data/models/surah_model.dart';
import '../../theme_control/theme_control.dart';

class HomeController extends GetxController {
  final themeC = Get.put(ThemeController());
  final box = GetStorage();
  final List<Juz> _allJuz = [];
  List<Juz> get allJuz => _allJuz;

  RxBool isDataFetched = false.obs;

  // Instance database sqflite
  DatabaseInstance database = DatabaseInstance.instance;

  late DateFormat formattedDate = DateFormat('EEEE, d MMMM y', 'id');

  @override
  void onInit() {
    // cekTheme();
    initializeDateFormatting('id', null).then((_) {
      formattedDate;
      update();
    });

    ever(isDataFetched, (bool fetched) {
      if (!fetched) {
        getAllJuz();
      }
    });

    super.onInit();
  }

  // Function data get Last Read
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

  // Function data get Bookmark
  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await database.database;

    List<Map<String, dynamic>> allBookmark = await db.query('bookmark',
        where: 'last_read = 0', orderBy: 'juz, via, surah, ayah');
    return allBookmark;
  }

  // Function delete bookmark
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

  // Function toggle theme mode
  void changeTheme() async {
    Get.isDarkMode
        ? Get.changeTheme(AppTheme.lightMode)
        : Get.changeTheme(AppTheme.darkMode);

    themeC.isDark.toggle();

    print("isDarkMode: ${Get.isDarkMode}");
    print("isDark: ${themeC.isDark}");

    // read & remove database in getStore
    if (Get.isDarkMode) {
      box.remove('darkMode');
    } else {
      box.write('darkMode', true);
    }
  }

  // Function get allSurah to Tab 'Surah'
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/surah");
    var res = await http.get(url);

    List<dynamic> data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    List<Surah> results = data.map((e) => Surah.fromJson(e)).toList();
    print("Master Surah: ${results.length}");
    return results;
  }

  // Function get AllJuz to Tab 'Juz'
  Future<List<Juz>> getAllJuz() async {
    if (!isDataFetched.value) {
      _allJuz.clear();
      Set<int> juzNumbersSet = {};

      // for (int i = 1; i <= 30; i++) {
      // if (_allJuz.length >= 30) {
      //   break;
      // }
      // Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$i/ar.alafasy");
      while (_allJuz.length < 30) {
        Uri url = Uri.parse(
            "https://api.alquran.cloud/v1/juz/${_allJuz.length + 1}/ar.alafasy");
        var res = await http.get(url);

        Map<String, dynamic> data =
            (jsonDecode(res.body) as Map<String, dynamic>)["data"];

        Juz juz = Juz.fromJson(data);

        if (juz.number != null && !juzNumbersSet.contains(juz.number!)) {
          _allJuz.add(juz);
          juzNumbersSet.add(juz.number!);
        }
      }
      _allJuz.sort((a, b) => a.number!.compareTo(b.number as num));
      isDataFetched.value = true;
      update();
    }
    List<Juz> limitedList =
        _allJuz.sublist(0, _allJuz.length > 30 ? 30 : _allJuz.length);
    print("Master allJuz: ${_allJuz.length}");
    return limitedList;
  }
}
