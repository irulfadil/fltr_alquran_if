// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fltr_alquran_if/utils/color_system.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sqflite/sqflite.dart';
import '../../../data/db/database_instance.dart';
import '../../../data/models/juz_model.dart';
import '../../../data/models/juz_translate_model.dart';

class DetailJuzController extends GetxController {
  AutoScrollController autoScrollJuzCon = AutoScrollController();

  int index = 0;
  final player = AudioPlayer();

  // Instance database sqflite
  DatabaseInstance database = DatabaseInstance.instance;

  // Function addBookmark
  Future<void> addBookmark(bool lastRead, Ayah surah, int index) async {
    Database db = await database.database;
    bool flagExits = false;

    if (lastRead == true) {
      await db.delete('bookmark', where: "last_read = 1");
    } else {
      List checkData = await db.query("bookmark",
          columns: [
            "surah",
            "englishNameTranslation",
            "number_surah",
            "ayah",
            "juz",
            "via",
            "index_ayah",
            "last_read"
          ],
          where:
              "surah = '${surah.surah!.englishName!.replaceAll("'", "+")}' and englishNameTranslation = '${surah.surah!.englishNameTranslation}' and number_surah = ${surah.surah!.number} and ayah = ${surah.surah!.numberOfAyahs} and juz = ${surah.number} and via = 'surah' and index_ayah= $index and last_read = 0");

      if (checkData.isNotEmpty) {
        flagExits = true;
      }
    }

    if (flagExits == false) {
      await db.insert(
        "bookmark",
        {
          "surah": "${surah.surah!.englishName?.replaceAll("'", "+")}",
          "englishNameTranslation": "${surah.surah!.englishNameTranslation}",
          "number_surah": "${surah.surah!.number}",
          "ayah": "${surah.numberInSurah}",
          "juz": "${surah.juz}",
          "via": "juz",
          "index_ayah": "$index",
          "last_read": lastRead == true ? 1 : 0
        },
      );

      Get.back();
      Get.snackbar(
        "Success",
        "Save Bookmark Successfully",
        duration: const Duration(seconds: 1),
        colorText: ColorSystem.appColorWhite,
      );
    } else {
      Get.back();
      Get.snackbar(
        "Failed",
        "Bookmark is ready",
        duration: const Duration(seconds: 1),
        colorText: ColorSystem.appColorWhite,
      );
    }
    //query database
    var data = await db.query('bookmark');
    print(data);
  }

  // Function data get juzDetail
  Future<Juz> getJuzDetail(String juzNum) async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$juzNum/ar.alafasy");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    Juz juz = Juz.fromJson(data);
    return juz;
  }

  // Function data get juzDetail translate
  Future<JuzTranslate> getJuzDetailTranslate(String juzNum) async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$juzNum/en.asad");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    JuzTranslate juzInTranslate = JuzTranslate.fromJson(data);
    return juzInTranslate;
  }

  // Function play audio by juz
  void playAudio(Ayah ayahs) async {
    if (ayahs.audio != null) {
      try {
        await player.stop();
        await player.setUrl(ayahs.audio.toString());
        ayahs.statusAudio = "playing";
        update();
        await player.play();
        ayahs.statusAudio = "stop";
        await player.stop();
        update();
      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Error",
          middleText: "Error message: ${e.message.toString()}",
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Error",
          middleText: "Connection aborted: ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Error",
          middleText: "An error occured: $e",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "URL audio not valid.",
      );
    }
  }

  // Function pause audio by juz
  void pauseAudio(Ayah ayahs) async {
    try {
      await player.pause();
      ayahs.statusAudio = "pause";
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Error message: ${e.message.toString()}",
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Connection aborted: ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "An error occured: $e",
      );
    }
  }

  // Function resume audio by juz
  void resumeAudio(Ayah ayahs) async {
    try {
      ayahs.statusAudio = "playing";
      update();
      await player.play();
      ayahs.statusAudio = "stop";
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Error message: ${e.message.toString()}",
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Connection aborted: ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "An error occured: $e",
      );
    }
  }

  // Function stop audio by juz
  void stopAudio(Ayah ayahs) async {
    try {
      await player.stop();
      ayahs.statusAudio = "stop";
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Error message: ${e.message.toString()}",
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Connection aborted: ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "An error occured: $e",
      );
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
