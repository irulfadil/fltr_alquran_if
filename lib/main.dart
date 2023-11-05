import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/color.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: darkMode,
      theme: lightMode,
      title: 'Al Quran App',
      initialRoute: Routes.home,
      // themeMode: ThemeMode.system,
      // initialRoute: Routes.introduction,
      getPages: AppPages.routes,
    );
  }
}
