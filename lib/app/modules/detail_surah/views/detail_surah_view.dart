import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../utils/color_system.dart';
import '../../../data/models/surah_detail_model.dart';
import '../../../data/models/surah_detail_translate_model.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/detail_surah_controller.dart';

// ignore: must_be_immutable
class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({Key? key}) : super(key: key);
  final homeC = Get.find<HomeController>();
  late Map<String, dynamic>? bookmark;

  Future<List<dynamic>> fetchData() async {
    Future<SurahDetail> surahDetails =
        controller.getSurahDetail(Get.arguments['number'].toString());
    Future<SurahDetailTranslate> surahDetailTranslate =
        controller.getSurahDetailTranslate(Get.arguments['number'].toString());
    return await Future.wait([surahDetails, surahDetailTranslate]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Column(
            children: [
              Text(Get.arguments['englishName'] ?? "error"),
              const SizedBox(height: 3.0),
              Text(
                Get.arguments['englishNameTranslation'] ?? "error",
                style: const TextStyle(
                    color: ColorSystem.appColorGray, fontSize: 12),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        controller: controller.autoScrollSurahCon,
        // padding: const EdgeInsets.all(5.0),
        children: [
          FutureBuilder<List<dynamic>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
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
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
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

              if (Get.arguments['bookmark'] != null) {
                bookmark = Get.arguments['bookmark'];
                if (bookmark!['index_ayah'] > 1) {
                  controller.autoScrollSurahCon.scrollToIndex(
                    // +2 ini adalah angka index from autoScrollTag
                    // bookmark!['index_ayah'] + 2,
                    bookmark!['index_ayah'],
                    preferPosition: AutoScrollPosition.begin,
                  );
                }
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    snapshot.data != null ? snapshot.data![0].ayahs!.length : 0,
                itemBuilder: (context, index) {
                  if (snapshot.data!.isEmpty) {
                    const SizedBox();
                  }

                  Ayah ayahs = snapshot.data![0].ayahs![index];
                  AyahTranslate ayahsTranslate =
                      snapshot.data![1].ayahs![index];

                  SurahDetail surahAyahs = snapshot.data![0];
                  int numbAyahs = int.parse(ayahs.numberInSurah.toString());

                  return AutoScrollTag(
                    key: ValueKey(index),
                    controller: controller.autoScrollSurahCon,
                    index: index,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (numbAyahs == 1)
                          OrientationBuilder(
                            builder: (context, orientation) {
                              final isPotrait =
                                  orientation == Orientation.portrait;
                              return isPotrait
                                  ? BuildHeaderPortrait(
                                      homeC: homeC, surahAyahs: surahAyahs)
                                  : BuildHeaderLandscape(
                                      homeC: homeC, surahAyahs: surahAyahs);
                            },
                          ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Get.isDarkMode
                                ? ColorSystem.backgroundDarkSecondary
                                : ColorSystem.appColorBrown.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(Get.isDarkMode
                                          ? "assets/images/dark-list-numb-surah-4pt.png"
                                          : "assets/images/light-list-numb-surah-4pt.png"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: Get.isDarkMode
                                          ? const TextStyle(
                                              color: ColorSystem.appColorBrown)
                                          : Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.5,
                                  child: GetBuilder<DetailSurahController>(
                                    builder: (c) => Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // kondisi => stop => button play
                                        // kondisi => playing => button pause & button stop
                                        // kondisi => pause => button resume & button stop

                                        IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              title: "BOOKMARK",
                                              middleText:
                                                  "Choose Bookmark Type",
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    await c.addBookmark(true,
                                                        surahAyahs, index);
                                                    homeC.update();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: ColorSystem
                                                        .appColorTeal,
                                                    textStyle: const TextStyle(
                                                      color: ColorSystem
                                                          .appColorWhite,
                                                    ),
                                                  ),
                                                  child:
                                                      const Text("LAST READ"),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    c.addBookmark(false,
                                                        surahAyahs, index);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: ColorSystem
                                                        .appColorTeal,
                                                    textStyle: const TextStyle(
                                                      color: ColorSystem
                                                          .appColorWhite,
                                                    ),
                                                  ),
                                                  child: const Text("BOOKMARK"),
                                                ),
                                              ],
                                            );
                                          },
                                          icon: const Icon(
                                              Icons.bookmark_add_outlined),
                                        ),
                                        (ayahs.statusAudio == 'stop')
                                            ? (IconButton(
                                                onPressed: () {
                                                  c.playAudio(ayahs);
                                                },
                                                icon: const Icon(
                                                    Icons.play_arrow_rounded),
                                              ))
                                            : Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  (ayahs.statusAudio ==
                                                          'playing')
                                                      ? (IconButton(
                                                          onPressed: () {
                                                            c.pauseAudio(ayahs);
                                                          },
                                                          icon: const Icon(
                                                            Icons.pause,
                                                          ),
                                                        ))
                                                      : (IconButton(
                                                          onPressed: () {
                                                            c.resumeAudio(
                                                                ayahs);
                                                          },
                                                          icon: const Icon(
                                                              Icons.play_arrow),
                                                        )),
                                                  IconButton(
                                                    onPressed: () {
                                                      c.stopAudio(ayahs);
                                                    },
                                                    icon: const Icon(
                                                      Icons.stop,
                                                    ),
                                                  )
                                                ],
                                              )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ayahs.text.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                textAlign: TextAlign.right,
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                ayahsTranslate.text.toString(),
                                style: const TextStyle(
                                    color: ColorSystem.appColorGray,
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class BuildHeaderPortrait extends StatelessWidget {
  const BuildHeaderPortrait({
    super.key,
    required this.homeC,
    required this.surahAyahs,
  });

  final HomeController homeC;
  final SurahDetail surahAyahs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(homeC.isDark.isTrue
                ? "assets/images/header-dark.png"
                : "assets/images/header-light.png"),
            fit: BoxFit.fitWidth),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${surahAyahs.revelationType}",
              style: const TextStyle(
                color: ColorSystem.appColorBrown,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 0.2,
            ),
            Column(
              children: [
                const Text(
                  "",
                  style: TextStyle(
                    color: ColorSystem.appColorBrown,
                  ),
                ),
                Text(
                  "${surahAyahs.englishName}",
                  style: const TextStyle(
                    color: ColorSystem.appColorBrown,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 0.2,
            ),
            Text(
              "${surahAyahs.numberOfAyahs} Ayat",
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

class BuildHeaderLandscape extends StatelessWidget {
  const BuildHeaderLandscape({
    super.key,
    required this.homeC,
    required this.surahAyahs,
  });

  final HomeController homeC;
  final SurahDetail surahAyahs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(homeC.isDark.isTrue
              ? "assets/images/header-dark.png"
              : "assets/images/header-light.png"),
          // fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${surahAyahs.revelationType}",
              style: const TextStyle(
                color: ColorSystem.appColorWhite,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 0.2,
            ),
            Column(
              children: [
                const Text(
                  "",
                ),
                Text(
                  "${surahAyahs.englishName}",
                  style: const TextStyle(
                    color: ColorSystem.appColorWhite,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 0.2,
            ),
            Text(
              "${surahAyahs.numberOfAyahs} Ayat",
              style: const TextStyle(
                color: ColorSystem.appColorWhite,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
