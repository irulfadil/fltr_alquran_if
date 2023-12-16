import 'package:fltr_alquran_if/utils/color_system.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/information_privacy_controller.dart';

class InformationPrivacyView extends GetView<InformationPrivacyController> {
  const InformationPrivacyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information & Privacy'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Informasi Aplikasi"),
            subtitle: const Text("Info tentang aplikasi ini"),
            onTap: () {
              Get.toNamed(Routes.informationApp);
            },
            iconColor: ColorSystem.appColorTeal,
          ),
          ListTile(
            leading: const Icon(Icons.lock_rounded),
            title: const Text("Kebijakan Privasi"),
            subtitle: const Text("Kebijakan privasi aplikasi ini"),
            onTap: () {
              Get.toNamed(Routes.privacyApp);
            },
            iconColor: ColorSystem.appColorTeal,
          ),
        ],
      ),
    );
  }
}
