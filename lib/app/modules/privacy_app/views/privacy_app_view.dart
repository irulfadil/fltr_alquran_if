import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/privacy_app_controller.dart';

class PrivacyAppView extends GetView<PrivacyAppController> {
  const PrivacyAppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan Privacy'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: const [
          Center(
            child: Icon(
              Icons.lock_person,
              size: 32,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Saat Anda menggunakan aplikasi ini, Anda mempercayai kami dengan informasi Anda. Karena kami sangat fokus dengan privasi Anda, maka Kebijakan Privasi ini dimaksudkan untuk membantu Anda memahami data apa yang kami kumpulkan dan mengapa kami memerlukannya.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
              letterSpacing: 0.5,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          SizedBox(height: 10.0),
          Text(
            "Memerlukan Akses Penyimpanan",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          Text(
            "Aplikasi Al-Qur'an ini memerlukan akses ke penyimpanan di perangkat Anda, sehingga salah satu fitur bekerja dengan baik.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
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
