// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/juz_model.dart';
import '../../home/controllers/home_controller.dart';

class AccessMenuController extends GetxController {
  final homeC = Get.find<HomeController>();
  List<Juz> copyallJuz = [];

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // homeC.getAllJuz().then((juzList) {
    //   copyallJuz.addAll(juzList);
    // });
    getJuz();
    print("procesing access done...");
  }

  Future<List<Juz>> getJuz() async {
    copyallJuz.clear();
    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse("https://api.alquran.cloud/v1/juz/$i/ar.alafasy");
      var res = await http.get(url);

      Map<String, dynamic> data =
          (jsonDecode(res.body) as Map<String, dynamic>)["data"];

      Juz juz = Juz.fromJson(data);
      copyallJuz.add(juz);
      print("copyallJuz: $copyallJuz");
    }
    return copyallJuz;
  }
}
