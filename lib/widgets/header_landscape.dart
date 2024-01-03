import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/theme_control/theme_control.dart';
import '../utils/color_system.dart';

class HeaderLandscape extends StatelessWidget {
  const HeaderLandscape({
    super.key,
    required this.themeController,
    required this.revelationType,
    required this.englishName,
    required this.numberOfAyahs,
  });

  final ThemeController themeController;
  final String revelationType;
  final String englishName;
  final String numberOfAyahs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Container(
            height: 110,
            decoration: BoxDecoration(
              color: themeController.isDark.isTrue
                  ? ColorSystem.backgroundDarkSecondary
                  : ColorSystem.appColorBrown.withOpacity(0.1),
              image: DecorationImage(
                image: AssetImage(themeController.isDark.isTrue
                    ? "assets/images/header-dark.png"
                    : "assets/images/header-light.png"),
                fit: BoxFit.cover,
              ),
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
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeController.isDark.isTrue
                ? ColorSystem.backgroundDarkSecondary
                : ColorSystem.appColorBrown.withOpacity(0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(themeController.isDark.isTrue
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
