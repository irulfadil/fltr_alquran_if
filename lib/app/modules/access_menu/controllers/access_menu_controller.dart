// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../../data/models/juz_model.dart';
import '../../home/controllers/home_controller.dart';

class AccessMenuController extends GetxController {
  final homeC = Get.put(HomeController());

  List<Juz> allJuz = [];
  var isLoading = false.obs;

  void getSurahSearch() async {
    try {
      isLoading.value = true;
      List<Juz> juzList = await homeC.getAllJuz();
      if (juzList.isNotEmpty) {
        for (var juz in juzList) {
          if (!allJuz.contains(juz)) {
            allJuz.add(juz);
            // allJuz.add(juz.toJson());
          }
        }
      } else {
        print('Juz Empty');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  void onInit() {
    getSurahSearch();
    super.onInit();
  }
}
