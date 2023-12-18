import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorScreen extends StatefulWidget {
  const GeolocatorScreen({super.key});

  @override
  State<GeolocatorScreen> createState() => _GeolocatorScreenState();
}

class _GeolocatorScreenState extends State<GeolocatorScreen> {
  Position? currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;

  String currentAddress = "";

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

      setState(() {
        currentAddress = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> _initLocationAndAddress() async {
    currentLocation = await _getCurrentLocation();

    await _getAdressFromCoordinates();
  }

  @override
  void initState() {
    super.initState();
    _initLocationAndAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get User Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("_latitude:  ${currentLocation?.latitude}"),
            Text("_longitude: ${currentLocation?.longitude}"),
            Text(currentAddress),
          ],
        ),
      ),
    );
  }
}
