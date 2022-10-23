import 'package:flutter/material.dart';

import '../../core/core.dart';

class DefaultRefreshIndicator extends StatelessWidget {
  const DefaultRefreshIndicator({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.white,
      backgroundColor: AppColors.primary,
      onRefresh: () => Future.sync(() => onRefresh()),
      child: child,
    );
  }
}
