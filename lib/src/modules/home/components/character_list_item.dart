import 'package:breaking_bad_app/src/app/app_routes.dart';
import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/shared/components/image_network_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(
          AppRoutes.characterDetails,
          arguments: character,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(500),
                    ),
                    child: ImageNetworkBuilder(
                      character.img,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style: AppTextStyles.titleLarge(context)?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        "a.k.a. ${character.nickname}",
                        style: AppTextStyles.subtitle2(context),
                      ),
                      Text(
                        character.status,
                        style: AppTextStyles.bodyMedium(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.arrow_circle_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
