import 'package:breaking_bad_app/src/core/core.dart';
import 'package:flutter/material.dart';

class AppLoadingIcon extends StatelessWidget {
  const AppLoadingIcon({
    Key? key,
    this.valueColor = AppColors.primary,
    this.size,
  }) : super(key: key);

  final Color valueColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );
  }
}
