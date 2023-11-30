import 'package:get/get.dart';

import '../controllers/access_menu_controller.dart';

class AccessMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccessMenuController>(
      () => AccessMenuController(),
    );
  }
}
