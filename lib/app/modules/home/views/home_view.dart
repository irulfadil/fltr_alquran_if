import 'package:fltr_alquran_if/app/modules/home/controllers/home_controller.dart';
import 'package:fltr_alquran_if/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color.dart';
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
        title: Text(
          "Al Qur'an",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.left,
        ),
        // centerTitle: true,
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
            Container(
              // margin: const EdgeInsets.symmetric(vertical: 15.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: Get.isDarkMode
                      ? [headerDark, headerDark]
                      : [headerLight, headerLight],
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
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
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.menu_book,
                                  color: appColorWhite,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  "Terakhir di baca",
                                  style: TextStyle(
                                    color: appColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "Al-fatihah",
                              // style: Theme.of(context).textTheme.titleMedium,
                              style: TextStyle(
                                  color: appColorWhite, fontSize: 16.0),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Juz 1 | Ayat 7",
                              // style: Theme.of(context).textTheme.titleSmall,
                              style: TextStyle(
                                  color: appColorGray, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const TabBar(
              tabs: [
                Tab(text: 'SURAH'),
                Tab(text: 'JUZ'),
                Tab(text: 'BOOKMARK'),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Center(
                  child: FutureBuilder<List<Surah>>(
                    future: controller.getAllSurah(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/data_empty.png",
                                width: 50,
                                height: 50,
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
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Surah surah = snapshot.data![index];
                          // print("${detailJuz.surahs![1]}");

                          return ListTile(
                            onTap: () {
                              Get.toNamed(Routes.detailSurah, arguments: surah);
                            },
                            leading: Obx(
                              () => Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(controller.isDark.isTrue
                                          ? "assets/images/dark-list-numb-surah-4pt.png"
                                          : "assets/images/light-list-numb-surah-4pt.png"),
                                      fit: BoxFit.contain),
                                ),
                                child: Center(
                                  child: Text("${surah.number ?? 'Error'}",
                                      style: Get.isDarkMode
                                          ? const TextStyle(
                                              color: appColorWhite)
                                          : Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                ),
                              ),
                            ),
                            title: Text(
                              surah.englishName ?? 'Error',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            subtitle: Text(
                              "${surah.revelationType ?? 'Error'} | ${surah.numberOfAyahs ?? 'Error'} Ayat",
                              style: const TextStyle(
                                color: appColorGray,
                              ),
                            ),
                            trailing: Text(
                              surah.name ?? 'Error',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/data_empty.png",
                                width: 50,
                                height: 50,
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
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          Juz detailJuz = snapshot.data![index];
                          return ListTile(
                            onTap: () => Get.toNamed(Routes.detaillJuz,
                                arguments: detailJuz),
                            leading: Obx(
                              () => Container(
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
                                  child: Text("${index + 1}",
                                      style: Get.isDarkMode
                                          ? const TextStyle(
                                              color: appColorWhite)
                                          : Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                ),
                              ),
                            ),
                            title: Text(
                              "JUZ ${index + 1}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            subtitle: Text(
                              "Start from ${detailJuz.surahs![1]?.englishName} - ${detailJuz.surahs![detailJuz.surahs!.length]?.englishName}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const Center(
                  child: Text("Page 3"),
                ),
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.isDarkMode
              ? Get.changeTheme(lightMode)
              : Get.changeTheme(darkMode);
          controller.isDark.toggle();
        },
        child: Obx(
          () => Icon(Icons.color_lens_outlined,
              color: controller.isDark.isTrue ? appColorBrown : appColorWhite),
        ),
      ),
    );
  }
}
