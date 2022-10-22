import 'package:breaking_bad_app/src/app/app_routes.dart';
import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/shared/components/app_loading_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Modular.to.pushReplacementNamed(AppRoutes.home);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
          image: AssetImage(AppImages.splash),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: const SafeArea(
        child: Scaffold(
          body: Center(
            child: AppLoadingIcon(),
          ),
        ),
      ),
    );
  }
}
