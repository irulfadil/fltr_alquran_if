import 'package:fltr_alquran_if/app/modules/home/controllers/home_controller.dart';
import 'package:fltr_alquran_if/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../../data/models/juz_model.dart';
import '../../../data/models/surah_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: Get.isDarkMode ? 0 : 4,
        title: const Text(
          "Al Qur'an",
          style: TextStyle(color: ColorSystem.appColorWhite),
          textAlign: TextAlign.left,
        ),
        actions: [
          CustomIconButton(
            onPressed: () => Get.toNamed(Routes.search),
            icon: Icons.search,
            onTap: () {},
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.more_vert,
            onTap: () {},
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<HomeController>(builder: (c) {
              return FutureBuilder<Map<String, dynamic>?>(
                  future: c.getLastRead(),
                  builder: (context, snapshot) {
                    Map<String, dynamic>? lastRead = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            // colors: Get.isDarkMode
                            colors: controller.isDark.value
                                ? [
                                    ColorSystem.headerDark,
                                    ColorSystem.headerDark
                                  ]
                                : [
                                    ColorSystem.headerLight,
                                    ColorSystem.headerLight
                                  ],
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 6,
                                right: 5,
                                child: Opacity(
                                  opacity: 0.5,
                                  child: SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.asset(
                                        "assets/images/dark-logo-alquran-black.png",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.menu_book,
                                          color: ColorSystem.appColorWhite,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          "Last Read",
                                          style: TextStyle(
                                              color: ColorSystem.appColorWhite,
                                              fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      "...Loading",
                                      style: TextStyle(
                                          color: ColorSystem.appColorWhite,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "",
                                      style: TextStyle(
                                        color: ColorSystem.appColorWhite,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (!snapshot.hasData) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            // colors: Get.isDarkMode
                            colors: controller.isDark.value
                                ? [
                                    ColorSystem.headerDark,
                                    ColorSystem.headerDark
                                  ]
                                : [
                                    ColorSystem.headerLight,
                                    ColorSystem.headerLight
                                  ],
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 6,
                                right: 5,
                                child: Opacity(
                                  opacity: 0.5,
                                  child: SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.asset(
                                        "assets/images/dark-logo-alquran-black.png",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.menu_book,
                                          color: ColorSystem.appColorWhite,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          "Last Read",
                                          style: TextStyle(
                                              color: ColorSystem.appColorWhite,
                                              fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      "Data Empty",
                                      style: TextStyle(
                                          color: ColorSystem.appColorWhite,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "",
                                      style: TextStyle(
                                        color: ColorSystem.appColorWhite,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: controller.isDark.isTrue
                                  ? [
                                      ColorSystem.headerDark,
                                      ColorSystem.headerDark
                                    ]
                                  : [
                                      ColorSystem.headerLight,
                                      ColorSystem.headerLight
                                    ],
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onLongPress: () {
                                if (lastRead != null) {
                                  Get.defaultDialog(
                                    title: "Delete",
                                    middleText:
                                        "Are you sure delete last read bookmark",
                                    actions: [
                                      OutlinedButton(
                                          onPressed: () => Get.back(),
                                          child: Text(
                                            "CANCEL",
                                            style: Get.isDarkMode
                                                ? const TextStyle(
                                                    color: ColorSystem
                                                        .appColorWhite)
                                                : Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                          )),
                                      ElevatedButton(
                                        onPressed: () {
                                          controller
                                              .deletBookmark(lastRead['id']);
                                          Get.back();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorSystem.appColorTeal,
                                          textStyle: const TextStyle(
                                            color: ColorSystem.appColorWhite,
                                          ),
                                        ),
                                        child: const Text(
                                          "DELETE",
                                        ),
                                      )
                                    ],
                                  );
                                }
                              },
                              onTap: () {
                                if (lastRead != null) {
                                  switch (lastRead['via']) {
                                    case "juz":
                                      Juz detailJuz = controller
                                          .allJuz[lastRead['juz'] - 1];
                                      List<dynamic> surahInJuz =
                                          detailJuz.surahs!.keys.toList();

                                      Get.toNamed(Routes.detailSurah,
                                          arguments: {
                                            'detailJuz': detailJuz,
                                            'surahInJuz': surahInJuz,
                                            "bookmark": lastRead,
                                          });
                                      break;
                                    default:
                                      Get.toNamed(Routes.detailSurah,
                                          arguments: {
                                            "englishName": lastRead['surah']
                                                .toString()
                                                .replaceAll("+", ""),
                                            "number": lastRead['number_surah'],
                                            "englishNameTranslation": lastRead[
                                                'englishNameTranslation'],
                                            "bookmark": lastRead,
                                          });
                                  }
                                }
                              },
                              borderRadius: BorderRadius.circular(15.0),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 6,
                                    right: 5,
                                    child: Opacity(
                                      opacity: 0.5,
                                      child: SizedBox(
                                          height: 80,
                                          width: 80,
                                          child: Image.asset(
                                            "assets/images/dark-logo-alquran-black.png",
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.menu_book,
                                              color: ColorSystem.appColorWhite,
                                            ),
                                            SizedBox(width: 5.0),
                                            Text(
                                              "Last Read",
                                              style: TextStyle(
                                                  color:
                                                      ColorSystem.appColorWhite,
                                                  fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          lastRead == null
                                              ? ""
                                              : "${lastRead['surah'].replaceAll("+", "'")}",
                                          style: const TextStyle(
                                              color: ColorSystem.appColorWhite,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5.0),
                                        Text(
                                          lastRead == null
                                              ? ""
                                              : "Juz ${lastRead['juz']} | Ayat ${lastRead['ayah']}",
                                          style: const TextStyle(
                                            color: ColorSystem.appColorWhite,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  });
            }),
            const TabBar(
              tabs: [
                Tab(text: 'SURAH'),
                Tab(text: 'JUZ'),
                Tab(text: 'BOOKMARK'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState !=
                            ConnectionState.waiting) {
                          return Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/data_empty.png",
                                  width: 100,
                                  height: 100,
                                ),
                                const Text(
                                  "Data Empty",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          );
                          // return Container(
                          //   margin: const EdgeInsets.only(top: 20.0),
                          //   child: const Center(
                          //     child: SizedBox(
                          //       width: 35.0,
                          //       height: 35.0,
                          //       child: CircularProgressIndicator(
                          //         valueColor: AlwaysStoppedAnimation<Color>(
                          //             ColorSystem.appColorTeal),
                          //         strokeWidth: 5.0,
                          //       ),
                          //     ),
                          //   ),
                          // );
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/data_empty.png",
                                  width: 100,
                                  height: 100,
                                ),
                                const Text(
                                  "Data Empty",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];

                            return Obx(
                              () => ListTile(
                                onTap: () {
                                  Get.toNamed(Routes.detailSurah, arguments: {
                                    'number': surah.number,
                                    'englishName': surah.englishName,
                                    'englishNameTranslation':
                                        surah.englishNameTranslation,
                                  });
                                },
                                leading: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(controller
                                                .isDark.isTrue
                                            ? "assets/images/dark-list-numb-surah-4pt.png"
                                            : "assets/images/light-list-numb-surah-4pt.png"),
                                        fit: BoxFit.contain),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${surah.number ?? 'Error'}",
                                      style: TextStyle(
                                          color: controller.isDark.isTrue
                                              ? ColorSystem.appColorBrown
                                              : ColorSystem.appColorGreen,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  surah.englishName ?? 'Error',
                                  style: TextStyle(
                                    color: controller.isDark.isTrue
                                        ? ColorSystem.appColorWhite
                                        : ColorSystem.appColorBrown,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  "${surah.revelationType ?? 'Error'} | ${surah.numberOfAyahs ?? 'Error'} Ayat",
                                  style: const TextStyle(
                                    color: ColorSystem.appColorGray,
                                  ),
                                ),
                                trailing: Text(
                                  surah.name ?? 'Error',
                                  style: TextStyle(
                                    color: controller.isDark.isTrue
                                        ? ColorSystem.appColorWhite
                                        : ColorSystem.appColorBrown,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Center(
                    child: FutureBuilder<List<Juz>>(
                      future: controller.getAllJuz(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: const Center(
                              child: SizedBox(
                                width: 35.0,
                                height: 35.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      ColorSystem.appColorTeal),
                                  strokeWidth: 5.0,
                                ),
                              ),
                            ),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/data_empty.png",
                                  width: 100,
                                  height: 100,
                                ),
                                const Text(
                                  "Data Empty",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            Juz detailJuz = snapshot.data![index];

                            List<dynamic> surahInJuz =
                                detailJuz.surahs!.keys.toList();

                            String startSurah = detailJuz.surahs!.keys.first;
                            String lastSurah = detailJuz.surahs!.keys.last;

                            String? startNameSurah =
                                detailJuz.surahs![startSurah]!.englishName;
                            String? lastNameSurah =
                                detailJuz.surahs![lastSurah]!.englishName;
                            return Obx(
                              () => ListTile(
                                onTap: () => Get.toNamed(
                                  Routes.detaillJuz,
                                  arguments: {
                                    'detailJuz': detailJuz,
                                    'surahInJuz': surahInJuz
                                  },
                                ),
                                leading: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(controller.isDark.isTrue
                                          ? "assets/images/dark-list-numb-juz-4pt.png"
                                          : "assets/images/light-list-numb-juz-4pt.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                          color: controller.isDark.isTrue
                                              ? ColorSystem.appColorBrown
                                              : ColorSystem.appColorGreen,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Juz ${index + 1}",
                                  style: TextStyle(
                                      color: controller.isDark.isTrue
                                          ? ColorSystem.appColorWhite
                                          : ColorSystem.appColorBrown,
                                      fontSize: 16.0),
                                ),
                                subtitle: Text(
                                  "$startNameSurah - $lastNameSurah",
                                  style: const TextStyle(
                                    color: ColorSystem.appColorGray,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  GetBuilder<HomeController>(
                    builder: (c) {
                      return FutureBuilder<List<Map<String, dynamic>>>(
                        future: c.getBookmark(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              child: const Center(
                                child: SizedBox(
                                  width: 35.0,
                                  height: 35.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        ColorSystem.appColorTeal),
                                    strokeWidth: 5.0,
                                  ),
                                ),
                              ),
                            );
                          } else if (!snapshot.hasData) {
                            return Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/data_empty.png",
                                    width: 100,
                                    height: 100,
                                  ),
                                  const Text(
                                    "Data Empty",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }

                          return ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              Map<String, dynamic> data = snapshot.data![index];
                              // print(data);
                              return Obx(
                                () => ListTile(
                                  onTap: () {
                                    switch (data['via']) {
                                      case "juz":
                                        Juz detailJuz =
                                            controller.allJuz[data['juz'] - 1];
                                        List<dynamic> surahInJuz =
                                            detailJuz.surahs!.keys.toList();
                                        Get.toNamed(
                                          Routes.detaillJuz,
                                          arguments: {
                                            'detailJuz': detailJuz,
                                            'surahInJuz': surahInJuz,
                                            "bookmark": data,
                                          },
                                        );
                                        break;
                                      default:
                                        Get.toNamed(Routes.detailSurah,
                                            arguments: {
                                              "englishName": data['surah']
                                                  .toString()
                                                  .replaceAll("+", ""),
                                              "number": data['number_surah'],
                                              "englishNameTranslation": data[
                                                  'englishNameTranslation'],
                                              "bookmark": data,
                                            });
                                    }
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: controller.isDark.isTrue
                                        ? ColorSystem.appColorTeal
                                        : ColorSystem.appColorBrown,
                                    child: Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                        color: ColorSystem.appColorWhite,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "Surah ${data['surah'].replaceAll("+", "'")}",
                                    style: TextStyle(
                                        color: controller.isDark.isTrue
                                            ? ColorSystem.appColorWhite
                                            : ColorSystem.appColorBrown,
                                        fontSize: 16.0),
                                  ),
                                  subtitle: Text(
                                    "Ayah ${data['ayah']} - by ${data['via']}",
                                    style: const TextStyle(
                                      color: ColorSystem.appColorGray,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      c.deletBookmark(data['id']);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.changeTheme();
        },
        child: Obx(
          () => Icon(Icons.color_lens_outlined,
              color: controller.isDark.isTrue
                  ? ColorSystem.appColorBrown
                  : ColorSystem.appColorGray),
        ),
      ),
    );
  }
}
