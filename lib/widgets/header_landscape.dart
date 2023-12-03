import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/home/controllers/home_controller.dart';
import '../utils/color_system.dart';

class HeaderLandscape extends StatelessWidget {
  const HeaderLandscape({
    super.key,
    required this.homeC,
    required this.revelationType,
    required this.englishName,
    required this.numberOfAyahs,
  });

  final HomeController homeC;
  final String revelationType;
  final String englishName;
  final String numberOfAyahs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(homeC.isDark.isTrue
              ? "assets/images/header-dark.png"
              : "assets/images/header-light.png"),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              revelationType,
              style: const TextStyle(
                color: ColorSystem.appColorBrown,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 0.1,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 55.0,
                ),
                Text(
                  englishName,
                  style: const TextStyle(
                    color: ColorSystem.appColorBrown,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 0.1,
            ),
            Text(
              "$numberOfAyahs Ayat",
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
