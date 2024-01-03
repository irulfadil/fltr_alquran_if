// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/color_system.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../../data/models/juz_model.dart';
import '../../../data/models/surah_model.dart';
import '../../../routes/app_pages.dart';
import '../../loading/loading_alljuz.dart';
import '../../theme_control/theme_control.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final indexTabHome = Get.arguments['indexTabHome'] ?? 0;
  final indexTabBookmark = Get.arguments['indexTabBokkmark'] ?? 0;
  final themeC = Get.find<ThemeController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.isDarkMode) {
        themeC.isDark.value = true;
      }
    });

    // Setting datetime
    final now = DateTime.now();
    String formattedDate = controller.formattedDate.format(now);

    return Scaffold(
      appBar: AppBar(
        elevation: themeC.isDark.isTrue ? 0 : 4,
        title: const Text(
          "Al Qur'an",
          textAlign: TextAlign.left,
        ),
        actions: [
          CustomIconButton(
            onPressed: () => Get.toNamed(Routes.search),
            icon: Icons.search,
            iconColor: ColorSystem.appColorWhite,
            onTap: () {},
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'setting') {
                Get.toNamed(Routes.setting);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'setting',
                child: ListTile(
                  title: Row(
                    children: [
                      const Icon(Icons.settings),
                      const SizedBox(width: 8),
                      Text(
                        "Setting",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            Obx(
              () => Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: themeC.isDark.isTrue
                        ? [
                            ColorSystem.backgroundDarkSecondary,
                            ColorSystem.appColorBrown
                          ]
                        : [
                            ColorSystem.appColorGreen,
                            ColorSystem.appColorGrayDark
                          ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 5,
                      child: Center(
                        child: Text(formattedDate,
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Opacity(
                        opacity: 0.1,
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            "assets/images/dark-logo-alquran-black.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Menu"),
              onTap: () {
                Get.toNamed(Routes.accessMenu);
              },
            ),
            ListTile(
              leading: const Icon(Icons.mosque),
              title: const Text("Jadwal Sholat"),
              onTap: () {
                Get.toNamed(Routes.prayerSchedule);
              },
            ),
            ListTile(
              leading: const Icon(Icons.compass_calibration),
              title: const Text("Qiblah"),
              onTap: () {
                Get.toNamed(Routes.qiblah);
              },
            ),
            // untuk color SwitchListTile bisa set default di custom_theme.
          ],
        ),
      ),
      body: DefaultTabController(
        initialIndex: indexTabBookmark ?? indexTabHome,
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<HomeController>(builder: (c) {
              return FutureBuilder<Map<String, dynamic>?>(
                  future: c.getLastRead(),
                  builder: (context, snapshot) {
                    Map<String, dynamic>? lastRead = snapshot.data;
                    print("home lastread: $lastRead");
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: themeC.isDark.isTrue
                                  ? [
                                      ColorSystem.backgroundDarkSecondary,
                                      ColorSystem.appColorBrown
                                    ]
                                  : [
                                      ColorSystem.appColorWhite,
                                      ColorSystem.appColorGreen
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
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.menu_book,
                                            color: ColorSystem.appColorWhite,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text("Last Read",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        "...Loading",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text("",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (!snapshot.hasData) {
                      return Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: themeC.isDark.isTrue
                                  ? [
                                      ColorSystem.backgroundDarkSecondary,
                                      ColorSystem.appColorBrown
                                    ]
                                  : [
                                      ColorSystem.appColorGrayDark,
                                      ColorSystem.appColorGreen
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
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.menu_book,
                                            color: ColorSystem.appColorWhite,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            "Last Read",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        "Data Empty",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text("",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: themeC.isDark.isTrue
                                  ? [
                                      ColorSystem.backgroundDarkSecondary,
                                      ColorSystem.appColorBrown
                                    ]
                                  : [
                                      ColorSystem.appColorGreen,
                                      ColorSystem.appColorBrown
                                    ],
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onLongPress: () {
                                if (lastRead != null) {
                                  Get.defaultDialog(
                                    title: "Message",
                                    titleStyle:
                                        Theme.of(context).textTheme.titleLarge,
                                    middleTextStyle:
                                        Theme.of(context).textTheme.titleMedium,
                                    middleText:
                                        "Are you sure delete last read ?",
                                    actions: [
                                      SizedBox(
                                        width: 110,
                                        child: CustomElevatedButton(
                                          onPressed: () => Get.back(),
                                          text: "CANCEL",
                                          backgroundColor: themeC.isDark.isTrue
                                              ? Colors.transparent
                                              : ColorSystem.appColorWhite,
                                          colorBorder:
                                              ColorSystem.appColorWhite,
                                          colorText: themeC.isDark.isTrue
                                              ? ColorSystem.appColorWhite
                                              : ColorSystem.appColorBrown,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 110,
                                        child: CustomElevatedButton(
                                          onPressed: () {
                                            controller
                                                .deletBookmark(lastRead['id']);
                                            Get.back();
                                          },
                                          text: "DELETE",
                                          backgroundColor: Colors.red[700],
                                          colorBorder: Colors.transparent,
                                          colorText: ColorSystem.appColorWhite,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
                              onTap: () {
                                if (lastRead != null &&
                                    controller.allJuz.length >= 30) {
                                  switch (lastRead['via']) {
                                    case "juz":
                                      Juz detailJuz = controller
                                          .allJuz[lastRead['juz'] - 1];
                                      List<dynamic> surahInJuz =
                                          detailJuz.surahs!.keys.toList();
                                      Get.toNamed(Routes.detailJuz, arguments: {
                                        'detailJuz': detailJuz,
                                        'surahInJuz': surahInJuz,
                                        "bookmark": lastRead,
                                      });
                                    case "surah":
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
                                      break;
                                    default:
                                      null;
                                  }
                                } else {
                                  Get.defaultDialog(
                                    backgroundColor:
                                        ColorSystem.backgroundDarkSecondary,
                                    confirmTextColor: ColorSystem.appColorGray,
                                    titleStyle:
                                        Theme.of(context).textTheme.titleLarge,
                                    middleTextStyle:
                                        Theme.of(context).textTheme.titleMedium,
                                    title: "Message",
                                    middleText:
                                        "Last read data in processing...",
                                    actions: [
                                      SizedBox(
                                        width: 80,
                                        child: CustomElevatedButton(
                                          onPressed: () => Get.back(),
                                          text: "BACK",
                                          backgroundColor: Colors.transparent,
                                          colorBorder:
                                              ColorSystem.appColorWhite,
                                        ),
                                      ),
                                    ],
                                  );
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
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.menu_book,
                                              color: ColorSystem.appColorWhite,
                                            ),
                                            const SizedBox(width: 5.0),
                                            Text(
                                              "Last Read",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          lastRead == null
                                              ? ""
                                              : "${lastRead['surah'].replaceAll("+", "'")}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                        const SizedBox(height: 5.0),
                                        Text(
                                          lastRead == null
                                              ? ""
                                              : "Juz ${lastRead['juz']} | Ayat ${lastRead['ayah']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
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
                                        image: AssetImage(themeC.isDark.isTrue
                                            ? "assets/images/dark-list-numb-surah-4pt.png"
                                            : "assets/images/light-list-numb-surah-4pt.png"),
                                        fit: BoxFit.contain),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${surah.number ?? 'Error'}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  surah.englishName ?? 'Error',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                subtitle: Text(
                                  "${surah.revelationType ?? 'Error'} | ${surah.numberOfAyahs ?? 'Error'} Ayat",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                trailing: Text(
                                  surah.name ?? 'Error',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "MUHAMMADIBold",
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
                          return const LoadAlljuz();
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
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
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: 30,
                          itemBuilder: (BuildContext context, int index) {
                            Juz detailJuz = snapshot.data![index];

                            List<dynamic> surahInJuz =
                                detailJuz.surahs!.keys.toList();

                            List<dynamic> nameSurahInJuz = [];

                            for (String elemn in surahInJuz) {
                              var allData = detailJuz.surahs?[elemn];

                              if (allData != null) {
                                nameSurahInJuz
                                    .add(allData.englishName.toString());
                              }
                            }

                            // String startSurah = detailJuz.surahs!.keys.first;
                            // String lastSurah = detailJuz.surahs!.keys.last;

                            // String? startNameSurah =
                            //     detailJuz.surahs![startSurah]!.englishName;
                            // String? lastNameSurah =
                            //     detailJuz.surahs![lastSurah]!.englishName;

                            return Obx(
                              () => ListTile(
                                onTap: () => Get.toNamed(
                                  Routes.detailJuz,
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
                                      image: AssetImage(
                                        themeC.isDark.isTrue
                                            ? "assets/images/dark-list-numb-juz-4pt.png"
                                            : "assets/images/light-list-numb-juz-4pt.png",
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${detailJuz.number}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Juz ${detailJuz.number}",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                subtitle: Text(
                                  // ignore: unnecessary_string_interpolations
                                  "${nameSurahInJuz.join(', ')}",
                                  // "$startNameSurah - $lastNameSurah",
                                  style: Theme.of(context).textTheme.titleSmall,
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
                          }

                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30.0),
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
                              ),
                            );
                          }

                          return ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              Map<String, dynamic> data = snapshot.data![index];
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
                                          Routes.detailJuz,
                                          arguments: {
                                            'detailJuz': detailJuz,
                                            'surahInJuz': surahInJuz,
                                            "bookmark": data,
                                            //data bookmark, get index autoscroll
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
                                              //data bookmark, get index autoscroll
                                            });
                                    }
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: themeC.isDark.isTrue
                                        ? ColorSystem.appColorTeal
                                        : ColorSystem.appColorBrown
                                            .withOpacity(0.5),
                                    child: Text(
                                      "${index + 1}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(
                                    "${data['surah'].replaceAll("+", "'")}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  subtitle: Text(
                                    "Ayat ${data['ayah']} - by ${data['via']}",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        titleStyle: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                        middleTextStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        title: "Delete",
                                        middleText:
                                            "Are you sure delete bookmark ?",
                                        actions: [
                                          SizedBox(
                                            width: 110,
                                            child: CustomElevatedButton(
                                              onPressed: () => Get.back(),
                                              text: "CANCEL",
                                              backgroundColor: themeC
                                                      .isDark.isTrue
                                                  ? Colors.transparent
                                                  : ColorSystem.appColorWhite,
                                              colorBorder:
                                                  ColorSystem.appColorWhite,
                                              colorText: themeC.isDark.isTrue
                                                  ? ColorSystem.appColorWhite
                                                  : ColorSystem.appColorBrown,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 110,
                                            child: CustomElevatedButton(
                                              onPressed: () {
                                                c.deletBookmark(data['id']);
                                                Get.back();
                                              },
                                              text: "DELETE",
                                              backgroundColor: Colors.red[700],
                                              colorText:
                                                  ColorSystem.appColorWhite,
                                              colorBorder: Colors.transparent,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
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
    );
  }
}
