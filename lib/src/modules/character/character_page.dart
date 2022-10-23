import 'package:breaking_bad_app/src/modules/character/character_controller.dart';
import 'package:breaking_bad_app/src/modules/character/components/animated_modal.dart';
import 'package:breaking_bad_app/src/modules/character/components/character_details_data.dart';
import 'package:breaking_bad_app/src/modules/character/components/modal_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/modules/home/components/custom_app_bar.dart';
import 'package:breaking_bad_app/src/shared/components/app_background_container.dart';
import 'package:breaking_bad_app/src/shared/components/image_network_builder.dart';

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
  late CharacterController controller;

  @override
  void initState() {
    controller = CharacterController(character: widget.character);
    super.initState();
  }

  bool shouldExpand = true;
  bool showData = true;

  void animateModal() {
    setState(() {
      if (!shouldExpand) {
        shouldExpand = true;
        Future.delayed(const Duration(milliseconds: 320), () {
          setState(() {
            showData = true;
          });
        });
      } else {
        shouldExpand = false;
        showData = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBackgroundContainer(
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            onLeadingTap: () {
              Modular.to.pop();
            },
          ),
          body: GestureDetector(
            onTap: animateModal,
            child: Container(
              width: double.infinity,
              color: AppColors.backgroundColor(context),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ImageNetworkBuilder(
                    widget.character.img,
                    boxFit: BoxFit.fitHeight,
                  ),
                  Positioned(
                    bottom: 0,
                    child: AnimatedModal(
                      shouldExpand: shouldExpand,
                      showData: showData,
                      child: Column(
                        children: [
                          const ModalHeader(),
                          if (showData) ...[
                            CaracterDetailsData(
                              character: widget.character,
                              valueListenable: controller.quoteNotifier,
                              onGenerateNewQuote: () {
                                controller.getRandomQuote();
                              },
                            ),
                          ]
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
