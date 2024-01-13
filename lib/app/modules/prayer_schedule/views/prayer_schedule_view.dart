// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/color_system.dart';
import '../../../../widgets/widget_location_error.dart';
import '../../../routes/app_pages.dart';
import '../../../services/determine_location.dart';
import '../controllers/prayer_schedule_controller.dart';

// ignore: must_be_immutable
class PrayerScheduleView extends GetView<PrayerScheduleController> {
  PrayerScheduleView({super.key});
  DetermineLocation determineLocationC = Get.find<DetermineLocation>();
  final limit = const SizedBox(height: 5.0);

  @override
  Widget build(BuildContext context) {
    // Setting datetime
    final now = DateTime.now();
    String formattedDate = controller.formattedDate.format(now);

    Future<void> refresh() {
      return Future.delayed(const Duration(seconds: 4));
    }

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
                    await Future.delayed(const Duration(seconds: 8));
                    controller.checkLocationEnabled();
                    // Get.until(
                    //     (route) => Get.currentRoute != '/prayer-schedule');
                    // Get.back();
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
        title: const Text('Prayer Schedule'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: determineLocationC.determineLocation(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: const Center(
                child: SizedBox(
                  width: 35.0,
                  height: 35.0,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorSystem.appColorTeal),
                    strokeWidth: 5.0,
                  ),
                ),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.hasError) {
            return LocationErrorWidget(
              error: "Location disabled",
              callback: showLocationDialog,
            );
          }

          print("snapshot: ${snapshot.data}");
          final position = snapshot.data!;
          final latitude = position.latitude;
          final longitude = position.longitude;

          return Obx(
            () {
              // Get latitude & longtitude
              // double? latitude = controller.currentLocation.value?.latitude;
              // double? longitude = controller.currentLocation.value?.longitude;
              Coordinates myCoordinates;

              if (latitude != null && longitude != null) {
                myCoordinates = Coordinates(latitude, longitude);
              } else {
                myCoordinates = Coordinates(0, 0);
              }

              print("latitude: $latitude + longitude: $longitude");

              final params = CalculationMethod.singapore.getParameters();
              params.madhab = Madhab.shafi;
              final prayerTimes = PrayerTimes.today(myCoordinates, params);

              String subuh = DateFormat.jm('id').format(prayerTimes.fajr);
              String terbit = DateFormat.jm('id').format(prayerTimes.sunrise);
              String dzuhur = DateFormat.jm('id').format(prayerTimes.dhuhr);
              String asyar = DateFormat.jm('id').format(prayerTimes.asr);
              String maghrib = DateFormat.jm('id').format(prayerTimes.maghrib);
              String isya = DateFormat.jm('id').format(prayerTimes.isha);

              return RefreshIndicator(
                onRefresh: refresh,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Jadwal Sholat",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w600)),
                        Text(formattedDate,
                            style: Theme.of(context).textTheme.bodyMedium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_pin, color: Colors.red[700]),
                            Text(
                              determineLocationC.currentAddress.isNotEmpty
                                  ? determineLocationC.currentAddress.value
                                  : "loading location...",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subuh",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              subuh,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(width: 10.0),
                            const Icon(Icons.alarm, size: 32)
                          ],
                        ),
                      ],
                    ),
                    limit,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Terbit",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              terbit,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(width: 10.0),
                            const Icon(Icons.alarm, size: 32)
                          ],
                        ),
                      ],
                    ),
                    limit,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dzuhur",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              dzuhur,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(width: 10.0),
                            const Icon(Icons.alarm, size: 32)
                          ],
                        ),
                      ],
                    ),
                    limit,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ashar",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              asyar,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(width: 10.0),
                            const Icon(Icons.alarm, size: 32)
                          ],
                        ),
                      ],
                    ),
                    limit,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Maghrib",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              maghrib,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(width: 10.0),
                            const Icon(Icons.alarm, size: 32)
                          ],
                        ),
                      ],
                    ),
                    limit,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Isya'",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              isya,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(width: 10.0),
                            const Icon(Icons.alarm, size: 32)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
