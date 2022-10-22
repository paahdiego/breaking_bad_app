import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/repositories/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends ChangeNotifier {
  static const int pageSize = 10;

  final pageController = PagingController<int, CharacterModel>(
    firstPageKey: 0,
  );

  final characterRepository = CharacterRepository();

  final scrollController = ScrollController();

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
    notifyListeners();
  }

  void refresh() {
    pageController.refresh();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
