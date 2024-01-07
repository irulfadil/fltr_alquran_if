// ignore_for_file: avoid_print

import 'dart:ui' as ui;
import 'package:fltr_alquran_if/app/modules/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../data/models/juz_model.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/access_menu_controller.dart';

class AccessMenuView extends GetView<AccessMenuController> {
  AccessMenuView({Key? key}) : super(key: key);
  final accessC = Get.find<AccessMenuController>();

  @override
  Widget build(BuildContext context) {
    print("check copyallJuz: ${accessC.copyallJuz}");

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_access_menu.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Obx(
            () => accessC.isLoading.isTrue
                ? Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-logo-alquran-green.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-list-numb-surah-4pt.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.home,
                                  arguments: {"indexTabHome": 0},
                                );
                              },
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: ColorSystem.appColorWhite
                                        .withOpacity(0.5),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      ColorSystem.appColorWhite
                                          .withOpacity(0.30),
                                      ColorSystem.appColorGreen
                                          .withOpacity(0.5),
                                    ],
                                  ),
                                ),
                                child: const Center(
                                    child: Text(
                                  "Baca AlQur'an",
                                  style: TextStyle(
                                    color: ColorSystem.appColorWhite,
                                    fontSize: 16.0,
                                  ),
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            GetBuilder<HomeController>(
                              builder: (c) {
                                return FutureBuilder<Map<String, dynamic>?>(
                                  future: c.getLastRead(),
                                  builder: (context, snapshot) {
                                    Map<String, dynamic>? lastRead =
                                        snapshot.data;
                                    print("access lastread: $lastRead");

                                    return InkWell(
                                      onTap: () {
                                        if (lastRead != null &&
                                            accessC.copyallJuz.length >= 30) {
                                          switch (lastRead['via']) {
                                            case "juz":
                                              Juz detailJuz =
                                                  accessC.copyallJuz[
                                                      lastRead['juz'] - 1];
                                              List<dynamic> surahInJuz =
                                                  detailJuz.surahs!.keys
                                                      .toList();

                                              print("detailJuz: $detailJuz");
                                              print("surahInJuz: $surahInJuz");

                                              Get.toNamed(Routes.detailJuz,
                                                  arguments: {
                                                    'detailJuz': detailJuz,
                                                    'surahInJuz': surahInJuz,
                                                    "bookmark": lastRead,
                                                  });
                                              break;
                                            default:
                                              Get.toNamed(
                                                Routes.detailSurah,
                                                arguments: {
                                                  "englishName":
                                                      lastRead['surah']
                                                          .toString()
                                                          .replaceAll("+", ""),
                                                  "number":
                                                      lastRead['number_surah'],
                                                  "englishNameTranslation":
                                                      lastRead[
                                                          'englishNameTranslation'],
                                                  "bookmark": lastRead,
                                                },
                                              );
                                          }
                                        } else {
                                          Get.defaultDialog(
                                            title: "Message",
                                            middleText:
                                                "Last read data is empty or in processing...",
                                            backgroundColor: ColorSystem
                                                .backgroundDarkSecondary,
                                            confirmTextColor:
                                                ColorSystem.appColorGray,
                                            titleStyle: const TextStyle(
                                              color: ColorSystem.appColorGray,
                                              fontSize: 18.0,
                                            ),
                                            middleTextStyle: const TextStyle(
                                              color: ColorSystem.appColorGray,
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: 120,
                                                child: CustomElevatedButton(
                                                  onPressed: () => Get.back(),
                                                  text: "BACK",
                                                  colorText:
                                                      ColorSystem.appColorWhite,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  colorBorder:
                                                      ColorSystem.appColorWhite,
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: ColorSystem.appColorWhite
                                                .withOpacity(0.5),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              ColorSystem.appColorWhite
                                                  .withOpacity(0.30),
                                              ColorSystem.appColorGreen
                                                  .withOpacity(0.5),
                                            ],
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Terakhir Baca",
                                            style: TextStyle(
                                              color: ColorSystem.appColorWhite,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.home,
                                    arguments: {"indexTabBokkmark": 2});
                              },
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: ColorSystem.appColorWhite
                                        .withOpacity(0.5),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      ColorSystem.appColorWhite
                                          .withOpacity(0.15),
                                      ColorSystem.appColorWhite
                                          .withOpacity(0.15),
                                    ],
                                  ),
                                ),
                                child: const Center(
                                    child: Text(
                                  "Bookmark",
                                  style: TextStyle(
                                    color: ColorSystem.appColorWhite,
                                    fontSize: 16.0,
                                  ),
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.search);
                              },
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: ColorSystem.appColorWhite
                                        .withOpacity(0.5),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      ColorSystem.appColorWhite
                                          .withOpacity(0.30),
                                      ColorSystem.appColorGold
                                          .withOpacity(0.15),
                                    ],
                                  ),
                                ),
                                child: const Center(
                                    child: Text(
                                  "Search",
                                  style: TextStyle(
                                    color: ColorSystem.appColorWhite,
                                    fontSize: 16.0,
                                  ),
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.setting);
                                Future.delayed(const Duration(seconds: 2), () {
                                  const SplashScreen();
                                });
                                // Get.toNamed(Routes.setting);
                              },
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: ColorSystem.appColorWhite
                                        .withOpacity(0.5),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      ColorSystem.appColorWhite
                                          .withOpacity(0.30),
                                      ColorSystem.appColorGold
                                          .withOpacity(0.15),
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Setting",
                                    style: TextStyle(
                                      color: ColorSystem.appColorWhite,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}
