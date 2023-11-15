
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthServices extends GetxController {
  var isSkipIntro = false.obs;

  // Status skip introuction
  Future<bool> skipIntro() async {
    //change isSkipIntro be true
    final box = GetStorage();
    if (box.read("isSkipIntro") != null || box.read("isSkipIntro") == true) {
      return true;
    }
    return false;
  }

}