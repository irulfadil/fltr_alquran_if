import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Ini adalah contoh paragraf. Paragraf biasanya terdiri dari beberapa kalimat atau bagian yang berkaitan dan membentuk sebuah pikiran atau ide tertentu. Dalam pengembangan aplikasi, kita sering menggunakan widget Text untuk menampilkan teks seperti paragraf.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 16.0,
            color: ColorSystem.appColorBrown,
          ),
        ),
      ),
    );
  }
}
