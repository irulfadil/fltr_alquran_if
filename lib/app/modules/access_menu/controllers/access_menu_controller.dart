// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../../data/models/juz_model.dart';
import '../../home/controllers/home_controller.dart';

class AccessMenuController extends GetxController {
  final homeC = Get.put(HomeController());

  List<Juz> copyallJuz = [];
  var isLoading = true.obs;

  @override
  void onInit() async {
    await getAllJuzCopy();
    print("load juz processing...");
    super.onInit();
  }

  Future<void> getAllJuzCopy() async {
    try {
      isLoading.value = true;
      List<Juz> juzList = homeC.getAllJuz() as List<Juz>;
      if (juzList.isNotEmpty) {
        for (var juz in juzList) {
          if (!copyallJuz.contains(juz)) {
            copyallJuz.add(juz);
          }
        }
      } else {
        print('Juz Empty');
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
