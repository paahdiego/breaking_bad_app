import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';

class AppBackgroundContainer extends StatelessWidget {
  const AppBackgroundContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    final themeController = ThemeController.instance(context);
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return Container(
          width: sizes.displayWidth,
          height: sizes.displayHeight,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor(context),
          ),
          child: child,
        );
      },
    );
  }
}
