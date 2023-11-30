import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class ShimmerAnimatedEffect extends StatelessWidget {
  const ShimmerAnimatedEffect({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return ListTileShimmer(
      hasCustomColors: true,
      colors: [
        Colors.grey.withOpacity(0.3),
        Colors.grey.withOpacity(0.5),
        Colors.grey.withOpacity(0.3),
      ],
    );
  }
}
