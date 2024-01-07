// ignore_for_file: avoid_print

import 'package:fltr_alquran_if/app/modules/prayer_schedule/views/prayer_schedule_view.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class PrayerScheduleController extends GetxController {
  Rx<Position?> currentLocation = Rx<Position?>(null);
  RxString currentAddress = ''.obs;
  RxBool isLocationEnabled = false.obs;

  late bool servicePermission = false;
  late LocationPermission permission;

  late DateFormat formattedDate = DateFormat('EEEE, d MMMM y', 'id');

  @override
  void onInit() {
    initializeDateFormatting('id', null).then((_) {
      formattedDate;
      update();
    });
    initLocationAndAddress();
    super.onInit();
  }

  Future<void> checkLocationEnabled() async {
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    isLocationEnabled.value = locationEnabled;
    Get.log("locationEnabled: $isLocationEnabled");

    isLocationEnabled.isTrue
        ? Get.offAll(() => const PrayerScheduleView())
        : isLocationEnabled.isFalse;
  }

  // Function init location address.
  Future<void> initLocationAndAddress() async {
    try {
      Position? location = await determineLocation();
      currentLocation.value = location;
      await _getAdressFromCoordinates();
    } catch (e) {
      if (e is LocationServiceDisabledException) {
        print("LocationServiceDisabledException");
      }
    }
  }

  // Function current location
  Future<Position?> determineLocation() async {
    LocationPermission permission;

    // Test if location services are enabled.
    bool servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print('Location services are disabled. Please enable the services');
      return null;
    }

    // The service is enabled on major phones, but it's ok to check it
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(
          "Location permissions are permanently denied, we cannot request permissions.");
      return null;
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // Function get geocode the coordinate and convert them into address.
  _getAdressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentLocation.value!.latitude, currentLocation.value!.longitude);
      Placemark place = placemarks[0];

      if (placemarks.isNotEmpty) {
        currentAddress.value = "${place.locality}, ${place.country}";
      }
    } catch (e) {
      print(e);
    }
  }
}
