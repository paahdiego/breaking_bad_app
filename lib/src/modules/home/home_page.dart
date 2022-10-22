import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/core/theme/theme.dart';
import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/modules/home/components/no_itens_found.dart';
import 'package:breaking_bad_app/src/modules/home/home_controller.dart';
import 'package:breaking_bad_app/src/shared/components/app_gradient_container.dart';
import 'package:breaking_bad_app/src/shared/components/app_loading_icon.dart';
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
                return Container(
                  height: 0.5,
                  color: AppColors.fontColor(context),
                );
              },
              builderDelegate: PagedChildBuilderDelegate<CharacterModel>(
                animateTransitions: true,
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: AppLoadingIcon()),
                noItemsFoundIndicatorBuilder: (context) => const NoItemsFound(),
                noMoreItemsIndicatorBuilder: (context) => Container(
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                    child: Text("Todos os itens carregados."),
                  ),
                ),
                newPageProgressIndicatorBuilder: (context) => Container(
                  padding: const EdgeInsets.all(20),
                  child: const Center(child: AppLoadingIcon()),
                ),
                itemBuilder: (context, character, index) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(character.name),
                ),
              ),
            ),
          ),
          onRefresh: () {
            homeController.refresh();
          },
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.onLogoTap,
  }) : super(key: key);

  final VoidCallback? onLogoTap;

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
            title: GestureDetector(
              onTap: onLogoTap,
              child: Image.asset(
                AppImages.logo,
                fit: BoxFit.fitHeight,
                height: 80,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.dark_mode,
                  color: AppColors.blackOrWhite(context),
                ),
                onPressed: () {
                  themeController.changeTheme(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
