import 'package:get/get.dart';
import 'package:fltr_alquran_if/utils/color_system.dart';
import 'package:flutter/material.dart';
import '../../theme_control/theme_control.dart';
import '../controllers/privacy_app_controller.dart';

class PrivacyAppView extends GetView<PrivacyAppController> {
  PrivacyAppView({super.key});
  final themeC = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan Privacy'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          Center(
            child: Icon(
              Icons.lock_person,
              size: 32,
              color: themeC.isDark.isTrue
                  ? ColorSystem.appColorWhite
                  : ColorSystem.appColorTeal,
            ),
          ),
          const Divider(),
          Text(
            "Saat Anda menggunakan aplikasi ini, Anda mempercayai aplikasi ini dengan informasi Anda. Karena aplikasi ini sangat fokus dengan privasi Anda, maka Kebijakan Privasi ini dimaksudkan untuk membantu Anda memahami data apa yang digunakan dan mengapa memerlukannya.",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          const Divider(),
          const Text(
            "Akses Penyimpanan",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: ColorSystem.appColorTeal,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Aplikasi Al-Qur'an ini memerlukan akses ke penyimpanan di perangkat, sehingga salah satu fitur bekerja dengan baik untuk kenyamanan Anda sendiri.",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
