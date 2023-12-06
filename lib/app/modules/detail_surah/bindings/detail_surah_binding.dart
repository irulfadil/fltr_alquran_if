import 'package:get/get.dart';

import '../../setting/controllers/setting_controller.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSurahController>(
      () => DetailSurahController(),
    );
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}
