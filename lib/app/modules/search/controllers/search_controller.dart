// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../../data/models/surah_model.dart';
import '../../home/controllers/home_controller.dart';

class SearchControl extends GetxController {
  HomeController homeC = Get.find<HomeController>();

  var surahSearch = [].obs;
  var queryStart = [].obs;
  var isLoading = false.obs;

  void getSurahSearch() async {
    try {
      isLoading.value = true;
      List<Surah> surahList = await homeC.getAllSurah();
      if (surahList.isNotEmpty) {
        for (var surah in surahList) {
          queryStart.add(surah.toJson());
        }
      } else {
        print('Get Data Empty');
      }

      surahSearch.assignAll(queryStart);
    } catch (e) {
      print("Error $e");
    } finally {
      isLoading.value = false;
    }
  }

  void searchData(String enteredKeyword) async {
    if (enteredKeyword.isEmpty) {
      surahSearch.value = queryStart;
    } else {
      final results = surahSearch
          .where((data) => data['englishName']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      if (results.isNotEmpty) {
        surahSearch.value = RxList<dynamic>(results);
      } else {
        print("Result Empty");
      }
    }
    surahSearch.refresh();
    queryStart.refresh();
  }

  @override
  void onInit() {
    getSurahSearch();
    super.onInit();
  }
}
