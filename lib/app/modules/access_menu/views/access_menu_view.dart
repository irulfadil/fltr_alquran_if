import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
import '../../../data/models/juz_model.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/access_menu_controller.dart';

class AccessMenuView extends GetView<AccessMenuController> {
  AccessMenuView({Key? key}) : super(key: key);
  final homeC = Get.find<HomeController>();
  final accessC = Get.find<AccessMenuController>();

  @override
  Widget build(BuildContext context) {
    print("Sum Juz home: ${homeC.allJuz.length}");
    print("Juz access: ${accessC.allJuz}");
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.offAllNamed(
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
                        color: Colors.white.withOpacity(0.5),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.30),
                          ColorSystem.appColorGreen.withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      "Read AlQur'an",
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
                GetBuilder<HomeController>(builder: (c) {
                  return FutureBuilder<Map<String, dynamic>?>(
                    future: c.getLastRead(),
                    builder: (context, snapshot) {
                      Map<String, dynamic>? lastRead = snapshot.data;
                      return InkWell(
                        onTap: () {
                          if (lastRead != null) {
                            switch (lastRead['via']) {
                              case "juz":
                                Juz detailJuz =
                                    homeC.allJuz[lastRead['juz'] - 1];
                                List<dynamic> surahInJuz =
                                    detailJuz.surahs!.keys.toList();
                                // Map<String, dynamic> detailJuz =
                                //     accessC.allJuz[lastRead['juz'] - 1];
                                // List<dynamic> surahInJuz =
                                //     detailJuz['surahs'].keys.toList();
                                print(detailJuz);
                                print(surahInJuz);

                                Get.toNamed(Routes.detailSurah, arguments: {
                                  'detailJuz': detailJuz,
                                  'surahInJuz': surahInJuz,
                                  "bookmark": lastRead,
                                });
                                break;
                              default:
                                Get.toNamed(
                                  Routes.detailSurah,
                                  arguments: {
                                    "englishName": lastRead['surah']
                                        .toString()
                                        .replaceAll("+", ""),
                                    "number": lastRead['number_surah'],
                                    "englishNameTranslation":
                                        lastRead['englishNameTranslation'],
                                    "bookmark": lastRead,
                                  },
                                );
                            }
                          }
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.30),
                                ColorSystem.appColorGreen.withOpacity(0.5),
                              ],
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Last Read",
                            style: TextStyle(
                              color: ColorSystem.appColorWhite,
                              fontSize: 16.0,
                            ),
                          )),
                        ),
                      );
                    },
                  );
                }),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed(Routes.home,
                        arguments: {"indexTabBokkmark": 2});
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.15),
                          Colors.white.withOpacity(0.15),
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
                    Get.offAllNamed(Routes.search);
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.30),
                          ColorSystem.appColorGold.withOpacity(0.15),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
