// ignore_for_file: avoid_print

import 'package:fltr_alquran_if/app/modules/prayer_schedule/views/prayer_schedule_view.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../services/determine_location.dart';

class PrayerScheduleController extends GetxController {
  DetermineLocation determineLocationC = Get.put(DetermineLocation());
  Rx<Position?> currentLocation = Rx<Position?>(null);
  RxBool isLocationEnabled = false.obs;

  late DateFormat formattedDate = DateFormat('EEEE, d MMMM y', 'id');

  @override
  void onInit() {
    initializeDateFormatting('id', null).then((_) {
      formattedDate;
      update();
    });
    determineLocationC.initLocationAndAddress();
    super.onInit();
  }

  Future<void> checkLocationEnabled() async {
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    isLocationEnabled.value = locationEnabled;
    Get.log("locationEnabled: $isLocationEnabled");

    isLocationEnabled.isTrue
        ? Get.offAll(() => PrayerScheduleView())
        : isLocationEnabled.isFalse;
  }
}
