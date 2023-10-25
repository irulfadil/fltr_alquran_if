import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/last_read/bindings/last_read_binding.dart';
import '../modules/last_read/views/last_read_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.introduction,
      page: () => const IntroductionView(),
    ),
    GetPage(
        name: Routes.home,
        page: () => const HomeView(),
        binding: HomesBinding()),
    GetPage(
      name: Routes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.lastRead,
      page: () => const LastReadView(),
      binding: LastReadBinding(),
    ),
  ];
}
