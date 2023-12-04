// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/color_system.dart';
import '../../../routes/app_pages.dart';
import '../controllers/search_controller.dart';
import '../../home/controllers/home_controller.dart';

class SearchView extends GetView<SearchControl> {
  SearchView({Key? key}) : super(key: key);
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.isDarkMode) {
        homeC.isDark.value = true;
      }
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.offNamed(
                Routes.home,
                arguments: {"indexTabHome": 0},
              );
            },
            child: const Icon(
              Icons.arrow_back_sharp,
            ),
          ),
          title: const Text('Search'),
          centerTitle: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                style: const TextStyle(color: ColorSystem.appColorBlack),
                autofocus: true,
                onChanged: (value) => controller.searchData(value),
                cursorColor: ColorSystem.appColorGreen,
                decoration: InputDecoration(
                  focusColor: ColorSystem.appColorGreen,
                  fillColor: ColorSystem.appColorWhite,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: homeC.isDark.isTrue
                        ? ColorSystem.appColorGray
                        : ColorSystem.appColorGray,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  suffixIcon: InkWell(
                    onTap: () {
                      print("serching..");
                    },
                    child: const Icon(
                      Icons.search,
                      color: ColorSystem.appColorGreen,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Container(
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
              )
            : ListView.builder(
                itemCount: controller.surahSearch.length,
                itemBuilder: (BuildContext context, int index) {
                  var surah = controller.surahSearch[index];
                  return ListTile(
                    onTap: () {
                      Get.toNamed(Routes.detailSurah, arguments: {
                        'number': surah['number'],
                        'englishName': surah['englishName'],
                        'englishNameTranslation':
                            surah['englishNameTranslation'],
                      });
                    },
                    leading: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(homeC.isDark.isTrue
                                ? "assets/images/dark-list-numb-surah-4pt.png"
                                : "assets/images/light-list-numb-surah-4pt.png"),
                            fit: BoxFit.contain),
                      ),
                      child: Center(
                        child: Text(
                          "${surah['number']}",
                          style: TextStyle(
                              color: homeC.isDark.isTrue
                                  ? ColorSystem.appColorBrown
                                  : ColorSystem.appColorGreen,
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                    title: Obx(
                      () => Text(
                        surah["englishName"].toString(),
                        style: TextStyle(
                          color: homeC.isDark.isTrue
                              ? ColorSystem.appColorWhite
                              : ColorSystem.appColorBrown,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      "${surah["revelationType"]} | ${surah["numberOfAyahs"]} Ayah",
                      style: const TextStyle(
                        color: ColorSystem.appColorGray,
                      ),
                    ),
                    trailing: Text(
                      surah['name'],
                      style: TextStyle(
                        color: homeC.isDark.isTrue
                            ? ColorSystem.appColorWhite
                            : ColorSystem.appColorBrown,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
