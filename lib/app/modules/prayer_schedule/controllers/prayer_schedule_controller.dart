import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class PrayerScheduleController extends GetxController {
  Rx<Position?> currentLocation = Rx<Position?>(null);
  RxString currentAddress = ''.obs;

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

  // Function init location address.
  Future<void> initLocationAndAddress() async {
    currentLocation.value = await getCurrentLocation();
    await _getAdressFromCoordinates();
  }

  // Function current location
  Future<Position> getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      // ignore: avoid_print
      print("Location services are disabled.");
    }

    // The service is enabled on major phones, but it's ok to check it
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
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
      // ignore: avoid_print
      print(e);
    }
  }
}
