import 'package:breaking_bad_app/src/modules/home/components/all_list_items_loaded.dart';
import 'package:breaking_bad_app/src/modules/home/components/character_list_item.dart';
import 'package:breaking_bad_app/src/modules/home/components/custom_app_bar.dart';
import 'package:breaking_bad_app/src/modules/home/components/list_loading_icon.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/modules/home/components/no_itens_found.dart';
import 'package:breaking_bad_app/src/modules/home/home_controller.dart';
import 'package:breaking_bad_app/src/shared/components/app_background_container.dart';

import 'package:breaking_bad_app/src/shared/components/default_refresh_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    homeController.pageController.addPageRequestListener((pageKey) {
      homeController.fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackgroundContainer(
      child: Scaffold(
        appBar: CustomAppBar(
          onLogoTap: () {
            homeController.scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            );
          },
        ),
        body: DefaultRefreshIndicator(
          child: Scrollbar(
            child: PagedListView<int, CharacterModel>.separated(
              pagingController: homeController.pageController,
              scrollController: homeController.scrollController,
              separatorBuilder: (context, _) {
                return const SizedBox(height: 20);
              },
              builderDelegate: PagedChildBuilderDelegate<CharacterModel>(
                animateTransitions: true,
                firstPageProgressIndicatorBuilder: (context) =>
                    const ListLoadingIcon(),
                noItemsFoundIndicatorBuilder: (context) => const NoItemsFound(),
                noMoreItemsIndicatorBuilder: (context) =>
                    const AllListItemsLoaded(),
                newPageProgressIndicatorBuilder: (context) =>
                    const ListLoadingIcon(),
                itemBuilder: (context, character, index) => CharacterListItem(
                  character: character,
                ),
              ),
            ),
          ),
          onRefresh: () {
            homeController.refresh();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(FontAwesomeIcons.clover),
        ),
      ),
    );
  }
}
