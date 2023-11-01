import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/color.dart';
import '../../../data/models/juz_model.dart' as juz;
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  DetailJuzView({Key? key}) : super(key: key);

  final juz.Juz allJuz = Get.arguments;
  final DetailJuzController juzInTranslate = Get.put(DetailJuzController());

  @override
  Widget build(BuildContext context) {
    print("juztrans: ${juzInTranslate.getJuzDetailTranslate}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Juz ${allJuz.number.toString()}"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          FutureBuilder(
            future: controller.getJuzDetail(allJuz.number.toString()),
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

                  Map<String, dynamic> detailJuz = snapshot.data!.ayahs![index];
                  // Surah surah = Surah.fromJson(detailJuz["surah"]);
                  // print(detailJuz["text"]);

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
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Get.isDarkMode
                                        ? "assets/images/list_dark.png"
                                        : "assets/images/list_light.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    detailJuz["numberInSurah"].toString(),
                                    style: Get.isDarkMode
                                        ? const TextStyle(color: appColorWhite)
                                        : Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                        const Icon(Icons.bookmark_add_outlined),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                        const Icon(Icons.play_circle_outlined),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        detailJuz["text"].toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
