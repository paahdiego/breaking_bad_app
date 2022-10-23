import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/modules/home/components/custom_app_bar.dart';
import 'package:breaking_bad_app/src/shared/components/app_background_container.dart';
import 'package:breaking_bad_app/src/shared/components/image_network_builder.dart';

import '../../core/theme/theme.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  bool expands = true;
  bool showData = true;

  void animateModal(BuildContext context) {
    setState(() {
      if (!expands) {
        expands = true;
        Future.delayed(const Duration(milliseconds: 450), () {
          setState(() {
            showData = true;
          });
        });
      } else {
        expands = false;
        showData = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return AppBackgroundContainer(
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            onLeadingTap: () {
              Modular.to.pop();
            },
          ),
          body: Container(
            width: double.infinity,
            color: Colors.green,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.grey.shade900,
                  child: ImageNetworkBuilder(
                    widget.character.img,
                    boxFit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: AnimatedBuilder(
                    animation: ThemeController.instance(context),
                    builder: (context, _) {
                      return AnimatedContainer(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor(context),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.black,
                              blurRadius: 1.0,
                              spreadRadius: 0.2,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        constraints: BoxConstraints(
                          minWidth: sizes.displayWidth,
                          maxWidth: sizes.displayWidth,
                          minHeight: 0,
                          maxHeight: expands ? sizes.displayHeight * 0.5 : 40.0,
                        ),
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  animateModal(context);
                                },
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(32),
                                          ),
                                          color: AppColors.primary,
                                        ),
                                        width: 32,
                                        height: 8,
                                      ),
                                      const Divider(
                                        height: 0.0,
                                        thickness: 2.0,
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (showData) ...[
                                const SizedBox(height: 20),
                                DetailRowItem(
                                  title: "Personagem:",
                                  value: widget.character.name,
                                ),
                                DetailRowItem(
                                  title: "Apelido:",
                                  value: widget.character.nickname,
                                ),
                                DetailRowItem(
                                  title: "Aniversário:",
                                  value: widget.character.birthday,
                                ),
                                Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ocupação",
                                        style:
                                            AppTextStyles.titleMedium(context)
                                                ?.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ...widget.character.occupation
                                          .map(
                                            (e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 2.0,
                                              ),
                                              child: Text(
                                                e,
                                                style: AppTextStyles.titleLarge(
                                                    context),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ],
                                  ),
                                ),
                                DetailRowItem(
                                  title: "Status:",
                                  value: widget.character.status,
                                ),
                                DetailRowItem(
                                  title: "Ator/Atriz:",
                                  value: widget.character.portrayed,
                                ),
                                const SizedBox(height: 20),
                              ]
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailRowItem extends StatelessWidget {
  const DetailRowItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.titleMedium(context)?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: AppTextStyles.titleLarge(context),
          ),
        ],
      ),
    );
  }
}
