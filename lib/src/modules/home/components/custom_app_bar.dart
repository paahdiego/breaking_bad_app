import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.onLogoTap,
    this.leading,
    this.onLeadingTap,
  }) : super(key: key);

  final VoidCallback? onLogoTap;
  final Widget? leading;
  final VoidCallback? onLeadingTap;

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.instance(context);
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return AppBar(
          backgroundColor: AppColors.backgroundColor(context),
          centerTitle: true,
          toolbarHeight: 100,
          leading: onLeadingTap != null
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: AppColors.primaryOrWhite(context),
                  onPressed: onLeadingTap,
                )
              : null,
          title: GestureDetector(
            onTap: onLogoTap,
            child: Image.asset(
              AppImages.logo,
              fit: BoxFit.fitHeight,
              height: 65,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.dark_mode,
                color: AppColors.primaryOrWhite(context),
              ),
              onPressed: () {
                themeController.changeTheme(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
