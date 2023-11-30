import 'package:get/get.dart';

import '../modules/access_menu/bindings/access_menu_binding.dart';
import '../modules/access_menu/views/access_menu_view.dart';
import '../modules/detail_juz/bindings/detail_juz_binding.dart';
import '../modules/detail_juz/views/detail_juz_view.dart';
import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/loading/loading_alljuz.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.introduction,
      page: () => IntroductionView(),
    ),
    GetPage(
        name: Routes.home,
        page: () => const HomeView(),
        binding: HomesBinding()),
    GetPage(
      name: Routes.search,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.detailSurah,
      page: () => DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: Routes.detaillJuz,
      page: () => DetailJuzView(),
      binding: DetailJuzBinding(),
    ),
    GetPage(
      name: Routes.loading,
      page: () => const LoadAlljuz(),
      // binding: DetailJuzBinding(),
    ),
    GetPage(
      name: Routes.accessMenu,
      page: () => const AccessMenuView(),
      binding: AccessMenuBinding(),
    ),
  ];
}
