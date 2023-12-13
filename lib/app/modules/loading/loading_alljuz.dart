import 'package:flutter/material.dart';
import '../../../widgets/shimmer/shimmer_animation.dart';

class LoadAlljuz extends StatelessWidget {
  const LoadAlljuz({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget load Shimmer
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const ShimmerAnimatedEffect();
      },
    );
  }
}
