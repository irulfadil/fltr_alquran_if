import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import '../../../../widgets/widget_location_error.dart';
import '../../../routes/app_pages.dart';
import '../controllers/qiblah_controller.dart';
import 'qiblah_screen.dart';

class QiblahView extends GetView<QiblahController> {
  const QiblahView({super.key});

  @override
  Widget build(BuildContext context) {
    showLocationDialog() {
      if (controller.isLocationEnabled.value) {
        controller.checkLocationEnabled();
      } else {
        Get.defaultDialog(
          title: 'Location Service Disabled',
          content: const Text(
              'Please enable location services for the app to function properly.'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Go to Settings',
                      style: Theme.of(context).textTheme.titleSmall),
                  onPressed: () async {
                    await Geolocator.openLocationSettings();
                    await Future.delayed(const Duration(seconds: 4));
                    controller.checkLocationEnabled();
                  },
                ),
                TextButton(
                  child: Text('Close',
                      style: Theme.of(context).textTheme.titleSmall),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.home,
                arguments: {"indexTabHome": 0},
              );
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'Arah Qiblat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getPermission(),
        builder: (context, snapshot) {
          if (controller.hasPermission) {
            return const QiblahScreen();
          } else {
            return LocationErrorWidget(
              error: "Location disabled",
              callback: showLocationDialog,
            );
          }
        },
      ),
    );
  }
}
