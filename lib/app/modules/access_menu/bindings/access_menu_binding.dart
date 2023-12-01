import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/access_menu_controller.dart';

class AccessMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccessMenuController>(
      () => AccessMenuController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
