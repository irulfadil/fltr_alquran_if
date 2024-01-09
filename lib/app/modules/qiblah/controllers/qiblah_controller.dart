// ignore_for_file: avoid_print

import 'package:fltr_alquran_if/app/modules/qiblah/views/qiblah_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../services/determine_location.dart';

class QiblahController extends GetxController {
  DetermineLocation determineLocationC = Get.put(DetermineLocation());
  RxBool isLocationEnabled = false.obs;
  bool hasPermission = false;

  @override
  void onInit() {
    super.onInit();
    determineLocationC.initLocationAndAddress();
  }

  // Function check Location device.
  Future<void> checkLocationEnabled() async {
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    isLocationEnabled.value = locationEnabled;
    Get.log("locationEnabled: $isLocationEnabled");

    isLocationEnabled.isTrue
        ? Get.offAll(() => const QiblahView())
        : isLocationEnabled.isFalse;
  }

  // Function permission for lokasi device.
  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          hasPermission = (value == PermissionStatus.granted);
        });
      }
    }
  }
}
