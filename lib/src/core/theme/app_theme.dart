import 'package:breaking_bad_app/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData darkTheme(BuildContext context) => ThemeData.dark().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.transparent,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: AppColors.transparent,
          elevation: 0.0,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.caption(context)?.copyWith(fontSize: 14),
          ),
        ),
        cardTheme: Theme.of(context).cardTheme.copyWith(
              color: Colors.grey.shade600,
            ),
        floatingActionButtonTheme:
            Theme.of(context).floatingActionButtonTheme.copyWith(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: AppSizes.defaultBorderRadius,
            ),
            textStyle: AppTextStyles.bodyText2(context)?.copyWith(fontSize: 16),
          ),
        ),
        listTileTheme: ListTileTheme.of(context).copyWith(
          iconColor: AppColors.primary,
        ),
        iconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        primaryIconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: AppColors.primary,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppColors.fontColorDark,
                displayColor: AppColors.fontColorDark,
              ),
        ),
      );
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData.light().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.transparent,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: AppColors.transparent,
        ),
        cardTheme: Theme.of(context).cardTheme.copyWith(
              color: Colors.grey.shade300,
            ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.caption(context)?.copyWith(fontSize: 14),
          ),
        ),
        floatingActionButtonTheme:
            Theme.of(context).floatingActionButtonTheme.copyWith(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: AppSizes.defaultBorderRadius,
            ),
            textStyle: AppTextStyles.bodyText2(context)?.copyWith(fontSize: 16),
          ),
        ),
        listTileTheme: ListTileTheme.of(context).copyWith(
          iconColor: AppColors.primary,
        ),
        iconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        primaryIconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: AppColors.primary,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppColors.fontColorLight,
                displayColor: AppColors.fontColorLight,
              ),
        ),
      );
}
