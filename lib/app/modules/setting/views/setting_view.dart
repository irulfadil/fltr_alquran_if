import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  SettingView({Key? key}) : super(key: key);
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    controller.loadFontSizeArabic();

    String selectedValue = 'utsmani';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, top: 20),
        children: [
          const Text(
            "Arabic",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: ColorSystem.appColorTeal,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ListTile(
            title: const Text("Jenis Penulisan Arabic"),
            subtitle: const Text(
              "Utsmani",
              style: TextStyle(
                color: ColorSystem.appColorGray,
              ),
            ),
            onTap: () {
              Get.defaultDialog(
                title: "Jenis Penulisan Arabic",
                titleStyle: const TextStyle(
                  fontSize: 16.0,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RadioListTile<String>(
                        title: const Text('IndoPak / Asia'),
                        value: 'asia',
                        groupValue: selectedValue,
                        onChanged: (value) {}),
                    RadioListTile<String>(
                      title: const Text('Utsmani'),
                      value: 'utsmani',
                      groupValue: selectedValue,
                      onChanged: (value) {
                        selectedValue = value!;
                      },
                    ),
                  ],
                ),
                actions: [
                  SizedBox(
                    width: 100,
                    child: CustomElevatedButton(
                      onPressed: () => Get.back(),
                      text: "CANCEL",
                      backgroundColor: homeC.isDark.isTrue
                          ? Colors.transparent
                          : ColorSystem.appColorWhite,
                      colorBorder: ColorSystem.appColorWhite,
                      colorText: homeC.isDark.isTrue
                          ? ColorSystem.appColorWhite
                          : ColorSystem.appColorTeal,
                    ),
                  ),
                ],
              );
            },
          ),
          Obx(
            () => ListTile(
              title: const Text("Ukuran Font Arabic"),
              subtitle: Text(
                "${controller.isfontSizeArabic.value} px",
                style: const TextStyle(
                  color: ColorSystem.appColorGray,
                ),
              ),
              onTap: () {
                Get.defaultDialog(
                  title: "Ukuran Font Arabic",
                  titleStyle: const TextStyle(
                    fontSize: 16.0,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      7,
                      (index) {
                        return RadioListTile<int>(
                          title: Text('${index + 24} px'),
                          value: index + 24,
                          groupValue: controller.isfontSizeArabic.value,
                          onChanged: (value) {
                            controller.isfontSizeArabic.value = value!;
                            controller.saveFontSizeArabic();
                            Get.back();
                          },
                        );
                      },
                    ),
                  ),
                  actions: [
                    SizedBox(
                      width: 100,
                      child: CustomElevatedButton(
                        onPressed: () => Get.back(),
                        text: "CANCEL",
                        backgroundColor: homeC.isDark.isTrue
                            ? Colors.transparent
                            : ColorSystem.appColorWhite,
                        colorBorder: ColorSystem.appColorWhite,
                        colorText: homeC.isDark.isTrue
                            ? ColorSystem.appColorWhite
                            : ColorSystem.appColorTeal,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(
            color: homeC.isDark.isTrue
                ? ColorSystem.appColorGray
                : ColorSystem.appColorBrown,
          ),
          const Text(
            "Terjemahan",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: ColorSystem.appColorTeal,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Obx(
            () => SwitchListTile(
              title: const Text("Perlihatkan Terjemahan"),
              value: homeC.isEnabledTranslate.isTrue,
              onChanged: (value) {
                homeC.isEnabledTranslate.toggle();
              },
              secondary: const Icon(Icons.remove_red_eye_rounded,
                  color: ColorSystem.appColorTeal),
              activeColor: ColorSystem.appColorTeal,
              inactiveThumbColor: ColorSystem.appColorGray,
              inactiveTrackColor: Colors.grey[300],
            ),
          ),
          SwitchListTile(
            title: const Text("Translate"),
            value: false,
            onChanged: (value) {},
            secondary: const Icon(Icons.g_translate_outlined,
                color: ColorSystem.appColorTeal),
            // activeColor: ColorSystem.appColorTeal,
            inactiveThumbColor: ColorSystem.appColorGray,
            inactiveTrackColor: Colors.grey[300],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Divider(
            color: homeC.isDark.isTrue
                ? ColorSystem.appColorGray
                : ColorSystem.appColorBrown,
          ),
          const Text(
            "Lain-Lain",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: ColorSystem.appColorTeal,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Information & Privacy"),
            subtitle: const Text(
              "Information & Privacy policy",
              style: TextStyle(
                color: ColorSystem.appColorGray,
              ),
            ),
            onTap: () {
              Get.toNamed(Routes.informationPrivacy);
            },
            iconColor: ColorSystem.appColorTeal,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Contact us",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.web,
                    size: 32,
                    color: ColorSystem.appColorBrown,
                  ),
                  Icon(
                    Icons.email,
                    size: 32,
                    color: ColorSystem.appColorBrown,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
