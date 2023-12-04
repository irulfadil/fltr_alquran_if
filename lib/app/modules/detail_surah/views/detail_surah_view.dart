import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../utils/color_system.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/header_landscape.dart';
import '../../../../widgets/header_portrait.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.isDarkMode) {
        homeC.isDark.value = true;
      }
    });

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

              // argument bookmark use index autoscroll
              if (Get.arguments['bookmark'] != null) {
                bookmark = Get.arguments['bookmark'];
                // index_ayah for autoscroll
                if (bookmark!['index_ayah'] > 1) {
                  // +2 ini adalah angka index from autoScrollTag
                  // bookmark!['index_ayah'] + 2,
                  controller.autoScrollSurahCon.scrollToIndex(
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
                    index: index,
                    controller: controller.autoScrollSurahCon,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (numbAyahs == 1)
                          OrientationBuilder(
                            builder: (context, orientation) {
                              final orientation =
                                  MediaQuery.of(context).orientation;

                              return orientation == Orientation.portrait
                                  ? HeaderPortrait(
                                      homeC: homeC,
                                      revelationType:
                                          surahAyahs.revelationType.toString(),
                                      englishName:
                                          surahAyahs.englishName.toString(),
                                      numberOfAyahs:
                                          surahAyahs.numberOfAyahs.toString(),
                                    )
                                  : HeaderLandscape(
                                      homeC: homeC,
                                      revelationType:
                                          surahAyahs.revelationType.toString(),
                                      englishName:
                                          surahAyahs.englishName.toString(),
                                      numberOfAyahs:
                                          surahAyahs.numberOfAyahs.toString(),
                                    );
                            },
                          ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: homeC.isDark.isTrue
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
                                      image: AssetImage(homeC.isDark.isTrue
                                          ? "assets/images/dark-list-numb-surah-4pt.png"
                                          : "assets/images/light-list-numb-surah-4pt.png"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: homeC.isDark.isTrue
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
                                              titleStyle: TextStyle(
                                                color: homeC.isDark.isTrue
                                                    ? ColorSystem.appColorWhite
                                                    : ColorSystem.appColorBrown,
                                                fontSize: 18.0,
                                              ),
                                              middleTextStyle: TextStyle(
                                                color: homeC.isDark.isTrue
                                                    ? ColorSystem.appColorWhite
                                                    : ColorSystem.appColorBrown,
                                              ),
                                              title: "Save as",
                                              middleText:
                                                  "Please, Choose LastRead or Bookmark ?",
                                              actions: [
                                                SizedBox(
                                                  width: 110,
                                                  child: CustomElevatedButton(
                                                    onPressed: () async {
                                                      await c.addBookmark(true,
                                                          surahAyahs, index);
                                                      homeC.update();
                                                    },
                                                    text: "LAST READ",
                                                    backgroundColor: ColorSystem
                                                        .appColorBrown,
                                                    colorText: ColorSystem
                                                        .appColorWhite,
                                                    colorBorder:
                                                        Colors.transparent,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: CustomElevatedButton(
                                                    onPressed: () async {
                                                      c.addBookmark(false,
                                                          surahAyahs, index);
                                                    },
                                                    text: "BOOKMARK",
                                                    backgroundColor: ColorSystem
                                                        .appColorTeal,
                                                    colorBorder:
                                                        Colors.transparent,
                                                  ),
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
                                style: TextStyle(
                                  color: homeC.isDark.isTrue
                                      ? ColorSystem.appColorGray
                                          .withOpacity(0.5)
                                      : Colors.grey,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.left,
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
