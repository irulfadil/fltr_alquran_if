import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/home/controllers/home_controller.dart';
import '../utils/color_system.dart';

class HeaderPortrait extends StatelessWidget {
  const HeaderPortrait({
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
    // Brightness deviceBrightness = MediaQuery.of(context).platformBrightness;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: homeC.isDark.isTrue
                ? ColorSystem.backgroundDarkSecondary
                : ColorSystem.appColorBrown.withOpacity(0.1),
            image: DecorationImage(
                image: AssetImage(homeC.isDark.isTrue
                    ? "assets/images/header-dark.png"
                    : "assets/images/header-light.png"),
                fit: BoxFit.fitWidth),
          ),
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  revelationType,
                  style: const TextStyle(
                    color: ColorSystem.appColorBrown,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  englishName,
                  style: const TextStyle(
                    color: ColorSystem.appColorBrown,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "$numberOfAyahs Ayat",
                  style: const TextStyle(
                    color: ColorSystem.appColorBrown,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: homeC.isDark.isTrue
                ? ColorSystem.backgroundDarkSecondary
                : ColorSystem.appColorBrown.withOpacity(0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(homeC.isDark.isTrue
                        ? "assets/images/bismillah-dark.png"
                        : "assets/images/bismillah-light.png"),
                    // fit: BoxFit.cover
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
