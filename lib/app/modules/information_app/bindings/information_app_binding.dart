import 'package:get/get.dart';

import '../controllers/information_app_controller.dart';

class InformationAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationAppController>(
      () => InformationAppController(),
    );
  }
}
