import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/color_system.dart';
import '../../../data/models/surah_detail_model.dart';
import '../../../data/models/surah_detail_translate_model.dart';
import '../controllers/detail_surah_controller.dart';
import '../../../data/models/surah_model.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({Key? key}) : super(key: key);

  final DetailSurahController surahCon = Get.put(DetailSurahController());
  final Surah surah = Get.arguments;

  Future<List<dynamic>> fetchData() async {
    Future<SurahDetail> surahDetails =
        surahCon.getSurahDetail(surah.number.toString());
    Future<SurahDetailTranslate> surahDetailTranslate =
        surahCon.getSurahDetailTranslate(surah.number.toString());
    return await Future.wait([surahDetails, surahDetailTranslate]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Column(
            children: [
              Text(surah.englishName ?? "error"),
              const SizedBox(height: 3.0),
              Text(
                surah.englishNameTranslation ?? "error",
                style: const TextStyle(
                    color: ColorSystem.appColorGray, fontSize: 12),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          FutureBuilder<List<dynamic>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData) {
                return Center(
                  child: Column(children: [
                    Image.asset(
                      "assets/images/data_empty.png",
                      width: 200,
                      height: 200,
                    ),
                    Text(
                      "Data Empty",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ]),
                );
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

                  // print(surahAyahs);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                                            color: ColorSystem.appColorWhite)
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
                                            middleText: "Choose Bookmark Type",
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  c.addBookmark(
                                                      true, surahAyahs, index);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      ColorSystem.appColorTeal,
                                                  textStyle: const TextStyle(
                                                    color: ColorSystem
                                                        .appColorWhite,
                                                  ),
                                                ),
                                                child: const Text("LAST READ"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  c.addBookmark(
                                                      false, surahAyahs, index);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      ColorSystem.appColorTeal,
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
                                                (ayahs.statusAudio == 'playing')
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
                                                          c.resumeAudio(ayahs);
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
                      Text(
                        ayahs.text.toString(),
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        ayahsTranslate.text.toString(),
                        style: const TextStyle(
                            color: ColorSystem.appColorGray, fontSize: 16.0),
                      ),
                      const SizedBox(height: 20.0),
                    ],
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
