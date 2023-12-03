// ignore_for_file: avoid_print

import 'package:get/get.dart';

// import '../../../data/models/juz_model.dart';
import '../../home/controllers/home_controller.dart';

class AccessMenuController extends GetxController {
  final homeC = Get.put(HomeController());

  // List<Juz> copyallJuz = [];
  var isLoading = true.obs;

  // void getSurahSearch() async {
  //   try {
  //     isLoading.value = true;
  //     List<Juz> juzList = await homeC.getAllJuz();
  //     if (juzList.isNotEmpty) {
  //       for (var juz in juzList) {
  //         if (!copyallJuz.contains(juz)) {
  //           copyallJuz.add(juz);
  //           // allJuz.add(juz.toJson());
  //         }
  //       }
  //     } else {
  //       print('Juz Empty');
  //     }
  //   } catch (e) {
  //     print("Error $e");
  //   }
  // }

  // @override
  // void onInit() {
  //   getSurahSearch();
  //   super.onInit();
  // }
}
