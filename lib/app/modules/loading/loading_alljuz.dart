import 'package:flutter/material.dart';

import '../../../widgets/shimmer/shimmer_animation.dart';

class LoadAlljuz extends StatelessWidget {
  const LoadAlljuz({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return const ShimmerAnimatedEffect();
        // ListTile(
        //     onTap: () => {},
        //     leading: const ShimmerAnimatedEffect(),
        //     title: const ShimmerAnimatedEffect(),
        //     contentPadding:
        //         const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),);
      },
    );
  }
}
