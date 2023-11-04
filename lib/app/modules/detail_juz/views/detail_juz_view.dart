import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/color.dart';
import '../../../data/models/juz_model.dart' as juz;
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  DetailJuzView({Key? key}) : super(key: key);

  final DetailJuzController juzSurah = Get.put(DetailJuzController());
  final juz.Juz allJuz = Get.arguments;

  Future<List<dynamic>> fetchData() async {
    final juzDetail = juzSurah.getJuzDetail(allJuz.number.toString());
    final juzDetailTranslate =
        juzSurah.getJuzDetailTranslate(allJuz.number.toString());

    return await Future.wait([juzDetail, juzDetailTranslate]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juz ${allJuz.number.toString()}"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
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
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "mecca",
                                style: TextStyle(
                                  color: appColorWhite,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                allJuz.surahs!.toString(),
                                style: const TextStyle(
                                  color: appColorWhite,
                                ),
                              ),
                              Text(
                                allJuz.ayahs!.length.toString(),
                                style: const TextStyle(
                                  color: appColorWhite,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/data_empty.png",
                        width: 200,
                        height: 200,
                      ),
                      Text(
                        "Data Empty",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?[0].ayahs.length,
                itemBuilder: (context, index) {
                  if (snapshot.data!.isEmpty) {
                    const SizedBox();
                  }

                  Map<String, dynamic> detailAyahs =
                      snapshot.data![0].ayahs![index];
                  Map<String, dynamic> detailAyahsTranslate =
                      snapshot.data![1].ayahs![index];

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
                            vertical: 5,
                            horizontal: 5,
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
                                        ? "assets/images/dark-list-numb-juz-4pt.png"
                                        : "assets/images/light-list-numb-juz-4pt.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    detailAyahs["numberInSurah"].toString(),
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
                                  Opacity(
                                    opacity: 0.5,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.bookmark_add_outlined),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.play_circle_outlined),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        detailAyahs["text"].toString(),
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        detailAyahsTranslate["text"].toString(),
                        style: const TextStyle(
                            color: appColorGray, fontSize: 16.0),
                      ),
                      const SizedBox(height: 10.0),
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
