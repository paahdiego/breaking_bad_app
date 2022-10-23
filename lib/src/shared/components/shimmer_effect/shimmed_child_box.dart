import 'package:flutter/material.dart';

import 'package:breaking_bad_app/src/core/core.dart';

class ShimmedChildBox extends StatelessWidget {
  const ShimmedChildBox({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 32,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor(context),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: child,
      ),
    );
  }
}
