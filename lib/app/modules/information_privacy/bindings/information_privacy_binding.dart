import 'package:get/get.dart';

import '../controllers/information_privacy_controller.dart';

class InformationPrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationPrivacyController>(
      () => InformationPrivacyController(),
    );
  }
}
