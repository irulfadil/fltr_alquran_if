import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class QiblahController extends GetxController {
  Position? currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;

  RxString currentAddress = ''.obs;

  bool hasPermission = false;

  @override
  void onInit() {
    _initLocationAndAddress();
    super.onInit();
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

  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      // ignore: avoid_print
      print("Service disabed");
    }

    // The service is enabled on major phones, but it's ok to check it
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  //let's geocode the coordinate and convert them into address.
  _getAdressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentLocation!.latitude, currentLocation!.longitude);
      Placemark place = placemarks[0];

      currentAddress.value = "${place.locality}, ${place.country}";
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> _initLocationAndAddress() async {
    currentLocation = await _getCurrentLocation();

    await _getAdressFromCoordinates();
  }
}
