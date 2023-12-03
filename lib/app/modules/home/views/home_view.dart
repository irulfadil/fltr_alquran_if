// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_system.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../../data/models/juz_model.dart';
import '../../../data/models/surah_model.dart';
import '../../../routes/app_pages.dart';
import '../../loading/loading_alljuz.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final indexTabHome = Get.arguments['indexTabHome'] ?? 0;
  final indexTabBookmark = Get.arguments['indexTabBokkmark'] ?? 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.isDarkMode) {
        controller.isDark.value = true;
      }
    });

    return Scaffold(
      appBar: AppBar(
        elevation: controller.isDark.isTrue ? 0 : 4,
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
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          Obx(
            () => Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: controller.isDark.isTrue
                      ? [ColorSystem.headerDark, ColorSystem.headerDark]
                      : [ColorSystem.headerLight, ColorSystem.headerLight],
                ),
              ),
              child: Stack(children: [
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
                        )),
                  ),
                ),
              ]),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Menu"),
            onTap: () {
              Get.offAllNamed(Routes.accessMenu);
            },
          ),
          Obx(
            () => SwitchListTile(
              title: controller.isDark.isTrue
                  ? const Text("Dark")
                  : const Text("Light"),
              value: controller.isDark.isTrue,
              onChanged: (value) {
                controller.changeTheme();
              },
              secondary: controller.isDark.isTrue
                  ? const Icon(Icons.nightlight_round)
                  : const Icon(Icons.wb_sunny),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Setting"),
            onTap: () {},
          )
        ],
      )),
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
                      return Container(
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
                                            fontSize: 16.0,
                                          ),
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
                                      ),
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
                                    title: "Message",
                                    middleText:
                                        "Are you sure delete last read ?",
                                    actions: [
                                      OutlinedButton(
                                        onPressed: () => Get.back(),
                                        child: Text(
                                          "CANCEL",
                                          style: controller.isDark.isTrue
                                              ? const TextStyle(
                                                  color:
                                                      ColorSystem.appColorWhite)
                                              : Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                        ),
                                      ),
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
                                            fontWeight: FontWeight.w500,
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
                                if (lastRead != null &&
                                    controller.allJuz.length >= 30) {
                                  switch (lastRead['via']) {
                                    case "juz":
                                      Juz detailJuz = controller
                                          .allJuz[lastRead['juz'] - 1];
                                      List<dynamic> surahInJuz =
                                          detailJuz.surahs!.keys.toList();
                                      print("detailJuz: ${detailJuz.number}");
                                      print("surahInJuz: $surahInJuz");
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
                                    titleStyle: const TextStyle(
                                      color: ColorSystem.appColorGray,
                                    ),
                                    middleTextStyle: const TextStyle(
                                      color: ColorSystem.appColorGray,
                                    ),
                                    title: "Message",
                                    middleText:
                                        "Last read data in processing...",
                                    actions: [
                                      OutlinedButton(
                                        onPressed: () => Get.back(),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: ColorSystem.appColorGray),
                                        ),
                                        child: const Text(
                                          "Back",
                                          style: TextStyle(
                                            color: ColorSystem.appColorGray,
                                          ),
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
                                        ? ColorSystem.appColorGray
                                        : ColorSystem.appColorBrown,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  "${surah.revelationType ?? 'Error'} | ${surah.numberOfAyahs ?? 'Error'} Ayat",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                trailing: Text(
                                  surah.name ?? 'Error',
                                  style: TextStyle(
                                    color: controller.isDark.isTrue
                                        ? ColorSystem.appColorGray
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

                            String startSurah = detailJuz.surahs!.keys.first;
                            String lastSurah = detailJuz.surahs!.keys.last;

                            String? startNameSurah =
                                detailJuz.surahs![startSurah]!.englishName;
                            String? lastNameSurah =
                                detailJuz.surahs![lastSurah]!.englishName;
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
                                      image: AssetImage(controller.isDark.isTrue
                                          ? "assets/images/dark-list-numb-juz-4pt.png"
                                          : "assets/images/light-list-numb-juz-4pt.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${detailJuz.number}",
                                      style: TextStyle(
                                          color: controller.isDark.isTrue
                                              ? ColorSystem.appColorBrown
                                              : ColorSystem.appColorGreen,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Juz ${detailJuz.number}",
                                  style: TextStyle(
                                      color: controller.isDark.isTrue
                                          ? ColorSystem.appColorGray
                                          : ColorSystem.appColorBrown,
                                      fontSize: 16.0),
                                ),
                                subtitle: Text(
                                  "$startNameSurah - $lastNameSurah",
                                  style: const TextStyle(
                                    color: Colors.grey,
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
                                            ? ColorSystem.appColorGray
                                            : ColorSystem.appColorBrown,
                                        fontSize: 16.0),
                                  ),
                                  subtitle: Text(
                                    "Ayah ${data['ayah']} - by ${data['via']}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "Delete",
                                        middleText:
                                            "Are you sure delete bookmark ?",
                                        actions: [
                                          OutlinedButton(
                                              onPressed: () => Get.back(),
                                              child: Text(
                                                "CANCEL",
                                                style: controller.isDark.isTrue
                                                    ? const TextStyle(
                                                        color: ColorSystem
                                                            .appColorWhite)
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                              )),
                                          ElevatedButton(
                                            onPressed: () {
                                              c.deletBookmark(data['id']);
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorSystem.appColorTeal,
                                              textStyle: const TextStyle(
                                                color:
                                                    ColorSystem.appColorWhite,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            child: const Text(
                                              "DELETE",
                                            ),
                                          )
                                        ],
                                      );
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
    );
  }
}
