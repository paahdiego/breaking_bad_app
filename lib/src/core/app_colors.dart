import 'package:breaking_bad_app/src/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0b4944);
  static const Color secondary = Color(0xFFffd621);
  //Light Theme
  static const Color backgroundColorLight = white;
  static const Color subBackgroundColorLight = Color(0xFFD5D5D5);
  static const Color fontColorLight = Color(0xFF535648);

  //Dark Theme
  static const Color backgroundColorDark = black;
  static const Color subBackgroundColorDark = Color(0xFF88877b);
  static const Color fontColorDark = white;

  static const Color white = Color(0xFFfffdf7);
  static const Color black = Color(0xFF020A09);
  static const Color transparent = Colors.transparent;

  static const Color error = Color(0xFFF80000);

  static Color blackOrWhite(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) return white;
    return black;
  }

  static Color backgroundColor(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) return backgroundColorDark;
    return backgroundColorLight;
  }

  static Color subBackgroundColor(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) {
      return subBackgroundColorDark;
    }
    return subBackgroundColorLight;
  }

  static Color fontColor(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) return fontColorDark;
    return fontColorLight;
  }

  static Color foregroundColorBasedOnBackground(Color reference) {
    if (reference.computeLuminance() > 0.5) return fontColorDark;
    return Colors.white;
  }
}
