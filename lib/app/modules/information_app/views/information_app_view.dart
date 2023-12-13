import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/information_app_controller.dart';

class InformationAppView extends GetView<InformationAppController> {
  const InformationAppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information App'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: const [
          Text(
            "Assalamu'alaikum Warohmatullohi Wabarokatuhu.",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Text(
            "Aplikasi Al Quran adalah aplikasi yang Anda butuhkan untuk membaca Al Quran dimanapun Anda inginkan. Inilah saat yang tepat untuk menjadikan diri Anda lebih jujur, relax dan mengistirahatkan pikiran sejenak untuk membaca Al-Qur'an.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12.0,
              letterSpacing: 0.5,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          SizedBox(height: 5.0),
          Text(
            "Secara default Rasm AlQur'an pada aplikasi ini menggunakan Rasm Utsmani, mungkin Rasm ini belum terbiasa di kalangan indonesia yang terbiasa dengan Rasm IndoPak. Perbedaan keduanya terdapat pada penulisanya, bunyinya tetap sama. Aplikasi ini nantinya akan selalu diperbaiki mengikuti dengan versi Rasm IndoPak. Dan perlu diketahui  Rasm Utsmani adalah Rasm yang biasa digunakan pada Al-Qur'an di Madinah.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12.0,
              letterSpacing: 0.5,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          SizedBox(height: 5.0),
          Text(
            "Jika Anda menyukai dengan aplikasi ini, silahkan memberikan rating/feedback Anda tentang aplikasi ini di Google Play Store. Caranya sangat mudah dengan mengklik tombol bintang terbaik adalah bintang yang kelima. Silahkan bagikan aplikasi ini ke keluarga, sahabat, rekan kerja, relasi dan sosial media Anda.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12.0,
              letterSpacing: 0.5,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          Divider(),
          Text(
            "Terima kasih atas kepercayaan Anda.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
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
