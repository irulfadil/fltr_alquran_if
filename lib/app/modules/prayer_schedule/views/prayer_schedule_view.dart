// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../qiblah/controllers/qiblah_controller.dart';
import '../controllers/prayer_schedule_controller.dart';

class PrayerScheduleView extends GetView<PrayerScheduleController> {
  PrayerScheduleView({Key? key}) : super(key: key);
  final limit = const SizedBox(height: 5.0);
  final qiblahC = Get.find<QiblahController>();

  @override
  Widget build(BuildContext context) {
    // Setting date
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, MMMM d, y');
    String formattedDate = formatter.format(now);

    final myCoordinates = Coordinates(-6.795830762136366, 110.84889494008316);

    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Schedule'),
        centerTitle: true,
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Icon(Icons.location_pin),
                    Text(
                      qiblahC.currentAddress.value,
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
                      DateFormat.jm().format(prayerTimes.fajr),
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
                      DateFormat.jm().format(prayerTimes.sunrise),
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
                      DateFormat.jm().format(prayerTimes.dhuhr),
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
                      DateFormat.jm().format(prayerTimes.asr),
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
                      DateFormat.jm().format(prayerTimes.maghrib),
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
                      DateFormat.jm().format(prayerTimes.isha),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 10.0),
                    const Icon(Icons.alarm, size: 32)
                  ],
                ),
              ],
            ),
          ]),
    );
  }
}
