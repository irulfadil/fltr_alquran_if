import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

import '../../../data/models/surah_detail_model.dart';
import '../../../data/models/surah_detail_translate_model.dart';

class DetailSurahController extends GetxController {
  RxBool isDark = false.obs;
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

  void playAudio(Ayah? ayahs) async {
    if (ayahs!.audio != null) {
      try {
        await player.stop();
        await player.setUrl(ayahs.audio as String);
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
