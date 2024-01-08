import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
import '../../theme_control/theme_control.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  ContactUsView({Key? key}) : super(key: key);
  final themeC = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          Text(
            "Hubungi Kami",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          Divider(
            color: themeC.isDark.isTrue
                ? ColorSystem.appColorWhite
                : ColorSystem.appColorGray,
          ),
          Text(
            "Senang sekali mendengar dari Anda, Jika Anda memiliki pertanyaan, komentar, atau masukan, jangan ragu untuk menghubungi kontak ini. InsyaAllah membantu dan menjawab pertanyaan Anda.",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          const SizedBox(
            height: 20.0,
          ),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    letterSpacing: 0.5,
                    height: 1.5,
                  ),
              children: [
                const TextSpan(
                  text: "email:",
                ),
                TextSpan(
                  text: " djonkcreative@gmail.com",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ColorSystem.appColorTeal),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "Jangan ragu untuk menghubungi  jika Anda membutuhkan bantuan atau informasi lebih lanjut.",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
