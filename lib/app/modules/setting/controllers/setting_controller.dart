import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  RxInt isfontSizeArabic = 24.obs;
  final boxFontSize = GetStorage();

  void saveFontSizeArabic() {
    boxFontSize.write('isfontSizeArabic', isfontSizeArabic.value);
  }

  void loadFontSizeArabic() {
    isfontSizeArabic.value = boxFontSize.read('isfontSizeArabic') ?? 24;
  }
}
