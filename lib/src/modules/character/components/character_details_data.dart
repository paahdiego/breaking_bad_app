import 'package:breaking_bad_app/src/modules/character/components/character_occupation_list.dart';
import 'package:breaking_bad_app/src/modules/character/components/quote_box_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/modules/character/components/details_row_item.dart';
import 'package:breaking_bad_app/src/modules/character/quote_states.dart';

class CaracterDetailsData extends StatelessWidget {
  const CaracterDetailsData({
    Key? key,
    required this.character,
    required this.valueListenable,
    required this.onGenerateNewQuote,
  }) : super(key: key);

  final CharacterModel character;
  final ValueListenable<QuoteState> valueListenable;
  final VoidCallback onGenerateNewQuote;

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
          CharacterOccupationList(character: character),
          DetailRowItem(
            title: "Status:",
            value: character.status,
          ),
          DetailRowItem(
            title: "Ator/Atriz:",
            value: character.portrayed,
          ),
          const SizedBox(height: 20),
          Text(
            "Frase aleatória:",
            style: AppTextStyles.titleMedium(context)?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          QuoteBoxBuilder(
            valueListenable: valueListenable,
            onGenerateNewQuote: onGenerateNewQuote,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
