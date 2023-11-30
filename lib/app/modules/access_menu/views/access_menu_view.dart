import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
import '../../../routes/app_pages.dart';
import '../controllers/access_menu_controller.dart';

class AccessMenuView extends GetView<AccessMenuController> {
  const AccessMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_access_menu.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    shadowColor: ColorSystem.appColorBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    foregroundColor: ColorSystem.appColorWhite,
                    backgroundColor: ColorSystem.appColorGreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0), // foreground
                  ),
                  onPressed: () {
                    Get.offAllNamed(Routes.home);
                  },
                  child: const Text(
                    "Read",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
