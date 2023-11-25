import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme/custom_theme.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  //initialize get storage
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: box.read('darkMode') == null ? lightMode : darkMode,
      title: 'Al Quran App',
      initialRoute:
          box.read('isSkipIntro') == null ? Routes.introduction : Routes.home,
      getPages: AppPages.routes,
    );
  }
}
