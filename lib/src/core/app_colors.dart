import 'package:breaking_bad_app/src/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0b4944);
  static const Color secondary = Color(0xFFffd621);
  //Light Theme
  static const Color backgroundColorLight = white;
  static const Color fontColorLight = Color(0xFF535648);

  //Dark Theme
  static const Color backgroundColorDark = black;
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

  static Color primaryOrWhite(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) return white;
    return primary;
  }

  static Color backgroundColor(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) return backgroundColorDark;
    return backgroundColorLight;
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

  static LinearGradient shimmerGradient(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) return shimmerGradientDark;
    return shimmerGradientLight;
  }

  static const shimmerGradientLight = LinearGradient(
    colors: [
      Color(0xFFE8EEF2),
      Color(0xFF0b4944),
      Color(0xFFE8EEF2),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
  static const shimmerGradientDark = LinearGradient(
    colors: [
      Color(0xFF1E1E24),
      Color(0xFF0b4944),
      Color(0xFF1E1E24),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}
