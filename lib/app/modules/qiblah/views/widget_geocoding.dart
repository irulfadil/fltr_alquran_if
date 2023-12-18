import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class GeocodingWidget extends StatefulWidget {
  const GeocodingWidget({super.key});

  @override
  State<GeocodingWidget> createState() => _GeocodingWidgetState();
}

class _GeocodingWidgetState extends State<GeocodingWidget> {
  String _address = 'Address: ';

  @override
  void initState() {
    super.initState();
    getAddressFromCoordinates();
  }

  Future<void> getAddressFromCoordinates() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      37.7749, // Latitude
      -122.4194, // Longitude
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      setState(() {
        _address =
            'Address: ${place.street}, ${place.locality}, ${place.country}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geocoding Example'),
      ),
      body: Center(
        child: Text(_address),
      ),
    );
  }
}
