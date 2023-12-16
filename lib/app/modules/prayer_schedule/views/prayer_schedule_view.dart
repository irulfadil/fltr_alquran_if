import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/prayer_schedule_controller.dart';

class PrayerScheduleView extends GetView<PrayerScheduleController> {
  const PrayerScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Schedule'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Update not available',
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    );
  }
}
