// ignore_for_file: avoid_print

import 'package:fltr_alquran_if/app/modules/qiblah/views/qiblah_view.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class QiblahController extends GetxController {
  // Position? currentLocation;
  Rx<Position?> currentLocation = Rx<Position?>(null);
  RxBool isLocationEnabled = false.obs;
  late bool servicePermission = false;
  late LocationPermission permission;

  RxString currentAddress = ''.obs;
  bool hasPermission = false;

  @override
  void onInit() {
    super.onInit();
    initLocationAndAddress();
  }

  // Function check Location device
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

  // Function current location
  Future<Position?> _getCurrentLocation() async {
    LocationPermission permission;

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

  // Function init location address.
  Future<void> initLocationAndAddress() async {
    currentLocation.value = await _getCurrentLocation();

    await _getAdressFromCoordinates();
  }
}
