import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchControl>(
      () => SearchControl(),
    );
    Get.lazyPut(() => HomeController());
  }
}
