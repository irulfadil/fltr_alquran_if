import 'package:get/get.dart';

import '../controllers/help_app_controller.dart';

class HelpAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpAppController>(
      () => HelpAppController(),
    );
  }
}
