import 'package:get/get.dart';

import '../../qiblah/controllers/qiblah_controller.dart';
import '../controllers/prayer_schedule_controller.dart';

class PrayerScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayerScheduleController>(
      () => PrayerScheduleController(),
    );
    Get.lazyPut<QiblahController>(
      () => QiblahController(),
    );
  }
}
