import 'package:get/get.dart';

import '../modules/access_menu/bindings/access_menu_binding.dart';
import '../modules/access_menu/views/access_menu_view.dart';
import '../modules/detail_juz/bindings/detail_juz_binding.dart';
import '../modules/detail_juz/views/detail_juz_view.dart';
import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/help_app/bindings/help_app_binding.dart';
import '../modules/help_app/views/help_app_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information_app/bindings/information_app_binding.dart';
import '../modules/information_app/views/information_app_view.dart';
import '../modules/information_privacy/bindings/information_privacy_binding.dart';
import '../modules/information_privacy/views/information_privacy_view.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/loading/loading_alljuz.dart';
import '../modules/prayer_schedule/bindings/prayer_schedule_binding.dart';
import '../modules/prayer_schedule/views/prayer_schedule_view.dart';
import '../modules/privacy_app/bindings/privacy_app_binding.dart';
import '../modules/privacy_app/views/privacy_app_view.dart';
import '../modules/qiblah/bindings/qiblah_binding.dart';
import '../modules/qiblah/views/qiblah_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
// import '../modules/qiblah/views/qiblah_view.dart';

part 'app_routes.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.introduction,
      page: () => IntroductionView(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomesBinding(),
    ),
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
      name: Routes.detailJuz,
      page: () => DetailJuzView(),
      binding: DetailJuzBinding(),
    ),
    GetPage(
      name: Routes.loading,
      page: () => const LoadAlljuz(),
    ),
    GetPage(
      name: Routes.accessMenu,
      page: () => AccessMenuView(),
      binding: AccessMenuBinding(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.informationPrivacy,
      page: () => const InformationPrivacyView(),
      binding: InformationPrivacyBinding(),
    ),
    GetPage(
      name: Routes.informationApp,
      page: () => const InformationAppView(),
      binding: InformationAppBinding(),
    ),
    GetPage(
      name: Routes.privacyApp,
      page: () => PrivacyAppView(),
      binding: PrivacyAppBinding(),
    ),
    GetPage(
      name: Routes.helpApp,
      page: () => HelpAppView(),
      binding: HelpAppBinding(),
    ),
    GetPage(
      name: Routes.prayerSchedule,
      page: () => const PrayerScheduleView(),
      binding: PrayerScheduleBinding(),
    ),
    GetPage(
      name: Routes.qiblah,
      page: () => const QiblahView(),
      binding: QiblahBinding(),
    ),
  ];
}
