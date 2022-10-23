import 'package:breaking_bad_app/src/app/app_routes.dart';
import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/modules/character/character_page.dart';
import 'package:breaking_bad_app/src/modules/home/home_page.dart';
import 'package:breaking_bad_app/src/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  final animationDuration = const Duration(microseconds: 600);

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.splash,
          child: (context, _) => const SplashPage(),
        ),
        ChildRoute(
          AppRoutes.home,
          child: (context, _) => const HomePage(),
          duration: animationDuration,
          transition: TransitionType.scale,
        ),
        ChildRoute(
          AppRoutes.characterDetails,
          child: (context, arguments) {
            final character = arguments.data as CharacterModel;
            return CharacterDetailsPage(character: character);
          },
          duration: animationDuration,
          transition: TransitionType.scale,
        ),
      ];
}
