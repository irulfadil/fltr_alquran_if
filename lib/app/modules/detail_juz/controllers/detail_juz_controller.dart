import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import '../../../data/models/juz_model.dart';
import '../../../data/models/juz_translate_model.dart';

class DetailJuzController extends GetxController {
  int index = 0;
  final player = AudioPlayer();

  // get juzDetail
  Future<Juz> getJuzDetail(String juzNum) async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$juzNum/ar.alafasy");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    Juz juz = Juz.fromJson(data);
    return juz;
  }

  // get juzDetail translate
  Future<JuzTranslate> getJuzDetailTranslate(String juzNum) async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$juzNum/en.asad");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    JuzTranslate juzInTranslate = JuzTranslate.fromJson(data);
    return juzInTranslate;
  }

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
