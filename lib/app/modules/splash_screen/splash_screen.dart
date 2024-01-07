import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:get/get.dart';

import '../../../utils/color_system.dart';
import '../access_menu/views/access_menu_view.dart';
// import '../../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return AccessMenuView();
        // return const HomeScreen();
      }));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: double.infinity,
        decoration: const BoxDecoration(
          color: ColorSystem.backgroundDarkSecondary,
        ),
        child: Stack(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset("assets/images/logo_alquran.png"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("HomeScreen"));
  }
}
