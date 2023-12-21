// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../../data/models/juz_model.dart';
import '../../home/controllers/home_controller.dart';

class AccessMenuController extends GetxController {
  final homeC = Get.find<HomeController>();

  List<Juz> copyallJuz = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    homeC.getAllJuz().then((juzList) {
      copyallJuz.addAll(juzList);
    });
    print("procesing access done...");
  }
}
