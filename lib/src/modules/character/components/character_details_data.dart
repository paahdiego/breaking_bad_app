import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/models/character_model.dart';

import 'package:breaking_bad_app/src/modules/character/components/details_row_item.dart';
import 'package:flutter/material.dart';

class CaracterDetailsData extends StatelessWidget {
  const CaracterDetailsData({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20),
          DetailRowItem(
            title: "Personagem:",
            value: character.name,
          ),
          DetailRowItem(
            title: "Apelido:",
            value: character.nickname,
          ),
          DetailRowItem(
            title: "Aniversário:",
            value: character.birthday,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ocupação",
                  style: AppTextStyles.titleMedium(context)?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...character.occupation
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                        ),
                        child: Text(
                          e,
                          style: AppTextStyles.titleLarge(context),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          DetailRowItem(
            title: "Status:",
            value: character.status,
          ),
          DetailRowItem(
            title: "Ator/Atriz:",
            value: character.portrayed,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
