import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';

class AnimatedModal extends StatelessWidget {
  const AnimatedModal({
    Key? key,
    required this.shouldExpand,
    required this.showData,
    required this.child,
  }) : super(key: key);

  final bool shouldExpand;
  final bool showData;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return AnimatedBuilder(
      animation: ThemeController.instance(context),
      builder: (context, _) {
        return AnimatedContainer(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor(context),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.black,
                blurRadius: 1.0,
                spreadRadius: 0.2,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          constraints: BoxConstraints(
            minWidth: sizes.displayWidth,
            maxWidth: sizes.displayWidth,
            minHeight: 0,
            maxHeight: shouldExpand ? sizes.displayHeight * 0.75 : 40.0,
          ),
          duration: const Duration(milliseconds: 350),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: child,
          ),
        );
      },
    );
  }
}
