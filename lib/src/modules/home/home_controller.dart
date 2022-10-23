import 'dart:developer';

import 'package:breaking_bad_app/src/app/app_routes.dart';
import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/repositories/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController {
  final getRandomNotifier = ValueNotifier<bool>(false);

  static const int pageSize = 10;

  final pageController = PagingController<int, CharacterModel>(
    firstPageKey: 0,
  );

  final characterRepository = CharacterRepository();

  final scrollController = ScrollController();

  Future<void> getRandomCharacter() async {
    getRandomNotifier.value = true;
    try {
      final character = await characterRepository.getRandomCharacter();

      Modular.to.pushNamed(AppRoutes.characterDetails, arguments: character);
    } catch (e) {
      log(e.toString());
    }
    getRandomNotifier.value = false;
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final routes = await characterRepository.getCharacters(
        pageKey: pageKey,
        pageSize: pageSize,
      );
      final isLastPage = routes.length < pageSize;
      if (isLastPage) {
        pageController.appendLastPage(routes);
      } else {
        final nextPageKey = pageKey + 1;
        pageController.appendPage(routes, nextPageKey);
      }
    } catch (e) {
      pageController.error = e;
    }
  }

  void refresh() {
    pageController.refresh();
  }
}
