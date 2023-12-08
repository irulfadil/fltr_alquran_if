import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/color_system.dart';
import '../../../routes/app_pages.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  IntroductionView({Key? key}) : super(key: key);
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_introduction.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        //bluer effect
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 5.0,
                          ),
                          child: Container(),
                        ),
                        //gradients effect
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color:
                                  ColorSystem.appColorWhite.withOpacity(0.13),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ColorSystem.appColorWhite.withOpacity(0.15),
                                ColorSystem.appColorWhite.withOpacity(0.15),
                              ],
                            ),
                          ),
                        ),
                        //child
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Read, even if it's just one verse.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorSystem.appColorWhite,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-logo-alquran-green.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-list-numb-surah-4pt.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
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
                    Get.offAllNamed(
                      Routes.accessMenu,
                    );
                    box.write('isSkipIntro', true);
                  },
                  child: const Text(
                    "IQRAA'",
                    style: TextStyle(
                      color: ColorSystem.appColorWhite,
                      fontSize: 14.0,
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
