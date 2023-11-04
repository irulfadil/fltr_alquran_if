import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/color.dart';
import '../controllers/detail_surah_controller.dart';
import '../../../data/models/surah_detail_model.dart' as detail;
import '../../../data/models/surah_model.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({super.key});
  final Surah surah = Get.arguments;

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
                style: const TextStyle(color: appColorGray, fontSize: 12),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          FutureBuilder<detail.SurahDetail>(
            future: controller.getSurahDetail(surah.number.toString()),
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
                    snapshot.data != null ? snapshot.data!.ayahs!.length : 0,
                itemBuilder: (context, index) {
                  if (snapshot.data!.ayahs!.isEmpty) {
                    const SizedBox();
                  }
                  detail.Ayah ayahs = snapshot.data!.ayahs![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Get.isDarkMode
                              ? backgroundDarkSecondary
                              : appColorBrown.withOpacity(0.1),
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
                                        ? const TextStyle(color: appColorWhite)
                                        : Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.bookmark_add_outlined),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.play_circle_outlined),
                                    ),
                                  ],
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
                      Text(
                        "Tanslate Surahs",
                        style: Theme.of(context).textTheme.titleSmall,
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
