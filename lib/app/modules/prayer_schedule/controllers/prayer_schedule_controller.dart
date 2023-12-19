import 'package:get/get.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

class PrayerScheduleController extends GetxController {
//   Position? currentLocation;
//   late bool servicePermission = false;
//   late LocationPermission permission;

//   RxString currentAddress = ''.obs;

//   @override
//   void onInit() {
//     _initLocationAndAddress();
//     super.onInit();
//   }

// // Function init location address.
//   Future<void> _initLocationAndAddress() async {
//     currentLocation = await _getCurrentLocation();

//     await _getAdressFromCoordinates();
//   }

//   // Function current location
//   Future<Position> _getCurrentLocation() async {
//     servicePermission = await Geolocator.isLocationServiceEnabled();
//     if (!servicePermission) {
//       // ignore: avoid_print
//       print("Service disabled");
//     }

//     // The service is enabled on major phones, but it's ok to check it
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   // Function get geocode the coordinate and convert them into address.
//   _getAdressFromCoordinates() async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//           currentLocation!.latitude, currentLocation!.longitude);
//       Placemark place = placemarks[0];

//       currentAddress.value = "${place.locality}, ${place.country}";
//     } catch (e) {
//       // ignore: avoid_print
//       print(e);
//     }
//   }
}
