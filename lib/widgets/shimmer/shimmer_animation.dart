import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';

import '../../utils/color_system.dart';

class ShimmerAnimatedEffect extends StatelessWidget {
  const ShimmerAnimatedEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileShimmer(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      isDarkMode: Get.isDarkMode,
      hasCustomColors: true,
      colors: [
        ColorSystem.appColorBrown.withOpacity(0.3),
        Colors.grey.withOpacity(0.5),
        Colors.grey.withOpacity(0.3),
      ],
    );
  }
}
