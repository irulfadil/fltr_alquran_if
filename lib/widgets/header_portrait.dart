import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/data/models/surah_detail_model.dart';
import '../app/modules/home/controllers/home_controller.dart';
import '../utils/color_system.dart';

class HeaderPortrait extends StatelessWidget {
  const HeaderPortrait({
    super.key,
    required this.homeC,
    required this.surahAyahs,
  });

  final HomeController homeC;
  final SurahDetail surahAyahs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(homeC.isDark.isTrue
                ? "assets/images/header-dark.png"
                : "assets/images/header-light.png"),
            fit: BoxFit.fitWidth),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${surahAyahs.revelationType}",
              style: const TextStyle(
                color: ColorSystem.appColorBrown,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 0.2,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "${surahAyahs.englishName}",
                  style: const TextStyle(
                    color: ColorSystem.appColorBrown,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 0.2,
            ),
            Text(
              "${surahAyahs.numberOfAyahs} Ayat",
              style: const TextStyle(
                color: ColorSystem.appColorBrown,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
