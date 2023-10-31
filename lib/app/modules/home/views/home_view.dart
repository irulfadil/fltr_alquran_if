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
        title: const Text("Al Qur'an"),
        centerTitle: true,
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
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bismillahirahmanirahim",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: appColorBrown),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [appColorBrown, appBarGreen],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -50,
                          right: 0,
                          child: Opacity(
                            opacity: 0.5,
                            child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.asset(
                                  "assets/images/mosque.png",
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu_book,
                                    color: appColorWhite,
                                  ),
                                  SizedBox(height: 30.0),
                                  Text(
                                    "Terakhir di baca",
                                    style: TextStyle(
                                      color: appColorWhite,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.0),
                              Text(
                                "Al-fatihah",
                                style: TextStyle(
                                  color: appColorWhite,
                                ),
                              ),
                              Text(
                                "Juz 1 | Ayat 3",
                                style: TextStyle(
                                  color: appColorWhite,
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
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Image.asset(
                              "assets/images/data_empty.png",
                              width: 50,
                              height: 50,
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(Routes.detailSurah,
                                    arguments: surah);
                              },
                              leading: Obx(
                                () => Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(controller
                                                .isDark.isTrue
                                            ? "assets/images/list_dark.png"
                                            : "assets/images/list_light.png"),
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
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Image.asset(
                              "assets/images/data_empty.png",
                              width: 50,
                              height: 50,
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            Juz detailJuz = snapshot.data![index];
                            return ListTile(
                              onTap: () {},
                              leading: Obx(
                                () => Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(controller.isDark.isTrue
                                          ? "assets/images/list_dark.png"
                                          : "assets/images/list_light.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("${index + 1}"),
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
                                "${detailJuz.surahs![0]?.englishName} - ${detailJuz.surahs![detailJuz.surahs!.length - 1]?.englishName}",
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
