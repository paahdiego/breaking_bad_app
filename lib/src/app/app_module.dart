import 'package:breaking_bad_app/src/app/app_routes.dart';
import 'package:breaking_bad_app/src/modules/home/home_page.dart';
import 'package:breaking_bad_app/src/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.splash,
          child: (context, _) => const SplashPage(),
        ),
        ChildRoute(
          AppRoutes.home,
          child: (context, _) => const HomePage(),
          duration: Duration(milliseconds: 700),
          transition: TransitionType.scale,
        ),
      ];
}
