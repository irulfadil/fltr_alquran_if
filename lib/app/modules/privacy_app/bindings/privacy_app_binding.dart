import 'package:get/get.dart';

import '../controllers/privacy_app_controller.dart';

class PrivacyAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyAppController>(
      () => PrivacyAppController(),
    );
  }
}
