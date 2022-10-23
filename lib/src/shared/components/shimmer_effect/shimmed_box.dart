import 'package:breaking_bad_app/src/core/core.dart';
import 'package:flutter/material.dart';

import 'package:breaking_bad_app/src/shared/components/shimmer_effect/shimmed_child_box.dart';
import 'package:breaking_bad_app/src/shared/components/shimmer_effect/shimmer.dart';
import 'package:breaking_bad_app/src/shared/components/shimmer_effect/shimmer_loading.dart';

class ShimmedBox extends StatelessWidget {
  const ShimmedBox({
    Key? key,
    this.child,
    required this.isLoading,
  }) : super(key: key);

  final Widget? child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: AppColors.shimmerGradient(context),
      child: ShimmerLoading(
        isLoading: isLoading,
        child: ShimmedChildBox(
          child: child,
        ),
      ),
    );
  }
}
