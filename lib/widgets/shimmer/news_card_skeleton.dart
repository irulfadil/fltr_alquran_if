import 'package:flutter/material.dart';

import 'skeleton.dart';

class NewsCardSkeleton extends StatelessWidget {
  const NewsCardSkeleton({super.key});

  final double defaultPadding = 20.00;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Skeleton(height: 120, width: 120),
        SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 80),
              SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  const Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: defaultPadding),
                  const Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
