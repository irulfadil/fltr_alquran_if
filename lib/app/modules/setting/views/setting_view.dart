import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/color_system.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../../routes/app_pages.dart';
import '../../theme_control/theme_control.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  SettingView({Key? key}) : super(key: key);
  final themeC = Get.find<ThemeController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    // Controller load read FontSize in getStorage
    controller.loadFontSizeArabic();

    // Controller load read ThemeCurrent in getStorage
    controller.loadThemeCurrent();

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
            title: const Text(
              "Jenis Penulisan Arabic",
            ),
            subtitle: const Text(
              "Utsmani",
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
                        groupValue: controller.selectdValueFontArabic.value,
                        onChanged: (value) {}),
                    RadioListTile<String>(
                      title: const Text('Utsmani'),
                      value: 'utsmani',
                      groupValue: controller.selectdValueFontArabic.value,
                      onChanged: (value) {
                        controller.selectdValueFontArabic.value = value!;
                      },
                    ),
                  ],
                ),
                actions: [
                  SizedBox(
                    width: 120,
                    child: CustomElevatedButton(
                      onPressed: () => Get.back(),
                      text: "CANCEL",
                      backgroundColor: themeC.isDark.isTrue
                          ? ColorSystem.backgroundDarkSecondary
                          : ColorSystem.appColorWhite,
                      colorBorder: themeC.isDark.isTrue
                          ? ColorSystem.appColorGray
                          : ColorSystem.appColorBrown,
                      colorText: themeC.isDark.isTrue
                          ? ColorSystem.appColorWhite
                          : ColorSystem.appColorBrown,
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
                      width: 120,
                      child: CustomElevatedButton(
                        onPressed: () => Get.back(),
                        text: "CANCEL",
                        backgroundColor: themeC.isDark.isTrue
                            ? ColorSystem.backgroundDarkSecondary
                            : ColorSystem.appColorWhite,
                        colorBorder: themeC.isDark.isTrue
                            ? ColorSystem.appColorGray
                            : ColorSystem.appColorBrown,
                        colorText: themeC.isDark.isTrue
                            ? ColorSystem.appColorWhite
                            : ColorSystem.appColorBrown,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(
            color: themeC.isDark.isTrue
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
              title: const Text(
                "Perlihatkan Terjemahan",
                style: TextStyle(fontSize: 16.0),
              ),
              value: themeC.isEnabledTranslate.isTrue,
              onChanged: (value) {
                themeC.isEnabledTranslate.toggle();
              },
              secondary: const Icon(Icons.remove_red_eye_rounded,
                  color: ColorSystem.appColorTeal),
              activeColor: ColorSystem.appColorTeal,
              inactiveThumbColor: Colors.grey[500],
              inactiveTrackColor: Colors.grey[300],
            ),
          ),
          SwitchListTile(
            title: const Text(
              "Translate",
              style: TextStyle(fontSize: 16.0),
            ),
            value: false,
            onChanged: (value) {},
            secondary: const Icon(Icons.g_translate_outlined,
                color: ColorSystem.appColorTeal),
            activeColor: ColorSystem.appColorTeal,
            inactiveThumbColor: Colors.grey[500],
            inactiveTrackColor: Colors.grey[300],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Divider(
            color: themeC.isDark.isTrue
                ? ColorSystem.appColorGray
                : ColorSystem.appColorBrown,
          ),
          const Text(
            "Thema",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: ColorSystem.appColorTeal,
            ),
          ),
          Obx(
            () => ListTile(
              title: const Text("Thema Aplikasi"),
              subtitle: Text(
                controller.selectedThemeModeCurent.value,
              ),
              leading: themeC.isDark.isTrue
                  ? const Icon(Icons.nightlight_round)
                  : const Icon(Icons.wb_sunny),
              onTap: () {
                Get.defaultDialog(
                  title: "Pilih Thema Aplikasi",
                  titleStyle: const TextStyle(
                    fontSize: 16.0,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RadioListTile<String>(
                          title: const Text('Mengikuti Perangkat'),
                          value: "perangkat",
                          groupValue: controller.selectedThemeModeCurent.value,
                          onChanged: (value) {
                            controller.selectedThemeModeCurent.value = value!;
                            controller.saveThemeCurrent();
                            controller.changeThemeMode(value, context);
                            Get.back();
                          }),
                      RadioListTile<String>(
                        title: const Text('Terang (Light)'),
                        value: "light",
                        groupValue: controller.selectedThemeModeCurent.value,
                        onChanged: (value) {
                          controller.selectedThemeModeCurent.value = value!;
                          controller.saveThemeCurrent();
                          controller.changeThemeMode(value, context);
                          Get.back();
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Gelap (Dark)'),
                        value: "dark",
                        groupValue: controller.selectedThemeModeCurent.value,
                        onChanged: (value) {
                          controller.selectedThemeModeCurent.value = value!;
                          controller.saveThemeCurrent();
                          controller.changeThemeMode(value, context);
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  actions: [
                    SizedBox(
                      width: 120,
                      child: CustomElevatedButton(
                        onPressed: () => Get.back(),
                        text: "CANCEL",
                        backgroundColor: themeC.isDark.isTrue
                            ? ColorSystem.backgroundDarkSecondary
                            : ColorSystem.appColorWhite,
                        colorBorder: themeC.isDark.isTrue
                            ? ColorSystem.appColorGray
                            : ColorSystem.appColorBrown,
                        colorText: themeC.isDark.isTrue
                            ? ColorSystem.appColorWhite
                            : ColorSystem.appColorBrown,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(
            color: themeC.isDark.isTrue
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
              "Information & Privacy policy App",
            ),
            onTap: () {
              Get.toNamed(Routes.informationPrivacy);
            },
            iconColor: ColorSystem.appColorTeal,
          ),
          ListTile(
            leading: const Icon(Icons.help_outlined),
            title: const Text("Help"),
            subtitle: const Text(
              "Panduan Pengguna",
            ),
            onTap: () {
              Get.toNamed(Routes.helpApp);
            },
            iconColor: ColorSystem.appColorTeal,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Contact us",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onPressed: () {
                      Get.toNamed(Routes.contactUs);
                    },
                    icon: Icons.contact_phone,
                    iconColor: ColorSystem.appColorBrown,
                    iconSize: 32,
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  CustomIconButton(
                    onPressed: () {
                      Get.toNamed(Routes.contactUs);
                    },
                    icon: Icons.email,
                    iconColor: ColorSystem.appColorBrown,
                    iconSize: 32,
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
