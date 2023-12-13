import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/help_app_controller.dart';

class HelpAppView extends GetView<HelpAppController> {
  HelpAppView({Key? key}) : super(key: key);
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Center(
              child: Icon(
                Icons.live_help_outlined,
                size: 32,
                color: homeC.isDark.isTrue
                    ? ColorSystem.appColorWhite
                    : ColorSystem.appColorBrown,
              ),
            ),
            const Divider(),
            const Text(
              "Menyediakan panduan aplikasi kepada Anda agar lebik mudah dalam mengoperasikan aplikasi ini.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12.0,
                letterSpacing: 0.5,
                height: 1.5,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Fitur Pengguna:",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                height: 1.5,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Row(
              children: [
                Icon(
                  Icons.menu_book,
                  color: ColorSystem.appColorTeal,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Last Read ",
                  style: TextStyle(
                    color: ColorSystem.appColorTeal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  color: homeC.isDark.isTrue
                      ? ColorSystem.appColorWhite
                      : ColorSystem.appColorBrown,
                  fontFamily: "Poppins",
                  fontSize: 12.0,
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
                children: [
                  const TextSpan(
                    text:
                        "Fitur ini akan menampung data terkahir yang dibaca pengguna. Dalam hal ini pengguna harus melakukan penyimpanan dengan klik icon",
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.bookmark_add_outlined,
                      size: 16,
                      color: homeC.isDark.isTrue
                          ? ColorSystem.appColorWhite
                          : ColorSystem.appColorBrown,
                    ),
                  ),
                  const TextSpan(
                    text: " bookmark di pembatas ayat.",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              "- Open last read: Klik sekali di seluruh bagian headernya untuk membuka bagian ayat Al-Quran yang terkahir dibaca.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            const Text(
              "- Delete last read: Tekan agak lama nanti muncul sebuah message option delete dan cancel.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            Divider(
              color: homeC.isDark.isTrue
                  ? ColorSystem.appColorWhite
                  : ColorSystem.appColorGray,
            ),
            const Row(
              children: [
                Icon(
                  Icons.bookmark,
                  color: ColorSystem.appColorTeal,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Bookmark",
                  style: TextStyle(
                    color: ColorSystem.appColorTeal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            const Text(
              "Fitur ini dapat ditemukan di pembatas ayat pada saat membaca Al-Qura'an. Bookmark membantu dalam penyimpanan data dengan jenis last read dan bookmark.\n Untuk melihat data bookmark Anda bisa pergi ke Tab Bookmark.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12.0,
                letterSpacing: 0.5,
                height: 1.5,
              ),
            ),
            Divider(
              color: homeC.isDark.isTrue
                  ? ColorSystem.appColorWhite
                  : ColorSystem.appColorGray,
            ),
            const Row(
              children: [
                Icon(
                  Icons.play_arrow_rounded,
                  color: ColorSystem.appColorTeal,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Audio",
                  style: TextStyle(
                    color: ColorSystem.appColorTeal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  color: homeC.isDark.isTrue
                      ? ColorSystem.appColorWhite
                      : ColorSystem.appColorBrown,
                  fontFamily: "Poppins",
                  fontSize: 12.0,
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
                children: [
                  const TextSpan(
                    text:
                        "Fitur ini dapat ditemukan di pembatas ayat pada saat membaca Al-Qura'an. Klik icon",
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 16,
                      color: homeC.isDark.isTrue
                          ? ColorSystem.appColorWhite
                          : ColorSystem.appColorBrown,
                    ),
                  ),
                  const TextSpan(
                    text:
                        "play dan Anda dapat mendengarkan suara murottal dari ayat-ayat Al-Qur'an.",
                  ),
                ],
              ),
            ),
            Divider(
              color: homeC.isDark.isTrue
                  ? ColorSystem.appColorWhite
                  : ColorSystem.appColorGray,
            ),
            const Row(
              children: [
                Icon(
                  Icons.search,
                  color: ColorSystem.appColorTeal,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                    color: ColorSystem.appColorTeal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  color: homeC.isDark.isTrue
                      ? ColorSystem.appColorWhite
                      : ColorSystem.appColorBrown,
                  fontFamily: "Poppins",
                  fontSize: 12.0,
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
                children: [
                  const TextSpan(
                    text: "Klik icon ",
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.search,
                      size: 16,
                      color: homeC.isDark.isTrue
                          ? ColorSystem.appColorWhite
                          : ColorSystem.appColorBrown,
                    ),
                  ),
                  const TextSpan(
                    text:
                        "search untuk melakukan pencarian berdasarkan nama surah tujuan. Anda juga dapat menemukan button search di menu utama.",
                  ),
                ],
              ),
            ),
            Divider(
              color: homeC.isDark.isTrue
                  ? ColorSystem.appColorWhite
                  : ColorSystem.appColorGray,
            ),
            const Row(
              children: [
                Icon(
                  Icons.settings,
                  color: ColorSystem.appColorTeal,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Setting",
                  style: TextStyle(
                    color: ColorSystem.appColorTeal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  color: homeC.isDark.isTrue
                      ? ColorSystem.appColorWhite
                      : ColorSystem.appColorBrown,
                  fontFamily: "Poppins",
                  fontSize: 12.0,
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
                children: [
                  const TextSpan(
                    text:
                        "Fitur setting/pengaturan untuk mengatur kenyamanan pengguna mulai dari ukuran font, jenis arabic, penerjemah dan tema light/dark.\n Anda juga dapat menemukan setting/pengaturan ini di bagian menu utama yaitu sebuah button setting. Dan juga ada di bagian bar halaman utama pojok kanan icon",
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.more_vert,
                      size: 16,
                      color: homeC.isDark.isTrue
                          ? ColorSystem.appColorWhite
                          : ColorSystem.appColorBrown,
                    ),
                  ),
                  const TextSpan(
                    text: "vertical.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
