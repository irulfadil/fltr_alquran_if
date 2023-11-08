// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../common/extention/custom_theme_extension.dart';
// import '../utils/color_system.dart';

// ThemeData darkMode() {
//   final ThemeData base = ThemeData.dark();
//   return base.copyWith(
//     // ignore: deprecated_member_use
//     backgroundColor: ColorSystem.backgroundDark,
//     scaffoldBackgroundColor: ColorSystem.backgroundDark,
//     extensions: [CustomThemeExtension.darkMode],
//     appBarTheme: const AppBarTheme(
//       backgroundColor: ColorSystem.greyBackground,
//       titleTextStyle: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: ColorSystem.fontDark,
//       ),
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.light,
//       ),
//       iconTheme: IconThemeData(
//         color: ColorSystem.greyDark,
//       ),
//     ),
//     tabBarTheme: const TabBarTheme(
//       indicator: UnderlineTabIndicator(
//         borderSide: BorderSide(
//           color: ColorSystem.greenDark,
//           width: 2,
//         ),
//       ),
//       unselectedLabelColor: ColorSystem.greyDark,
//       labelColor: ColorSystem.greenDark,
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//       backgroundColor: ColorSystem.greenDark,
//       foregroundColor: ColorSystem.backgroundDark,
//       splashFactory: NoSplash.splashFactory,
//       elevation: 0,
//       shadowColor: Colors.transparent,
//     )),
//     bottomSheetTheme: const BottomSheetThemeData(
//       backgroundColor: ColorSystem.greyBackground,
//       modalBackgroundColor: ColorSystem.greyBackground,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//     ),
//     dialogBackgroundColor: ColorSystem.greyBackground,
//     dialogTheme: DialogTheme(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//     listTileTheme: const ListTileThemeData(
//       iconColor: ColorSystem.greyDark,
//       tileColor: ColorSystem.backgroundDark,
//     ),
//     switchTheme: const SwitchThemeData(
//       thumbColor: MaterialStatePropertyAll(ColorSystem.greyDark),
//       trackColor: MaterialStatePropertyAll(Color(0xFF344047)),
//     ),
//   );
// }
