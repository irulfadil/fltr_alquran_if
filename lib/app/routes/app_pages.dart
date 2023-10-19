import 'package:fltr_alquran_if/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';

import '../modules/home/views/home_view.dart';
import '../modules/introduction/views/introduction_view.dart';

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
  ];
}
