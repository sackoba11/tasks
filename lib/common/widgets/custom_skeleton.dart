import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeleton extends StatelessWidget {
  const CustomSkeleton({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      containersColor:
          Theme.of(context).brightness == Brightness.light
              ? Colors.grey[100]
              : Colors.grey[800],
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(milliseconds: 800),
      ),
      child: child,
    );
  }
}
