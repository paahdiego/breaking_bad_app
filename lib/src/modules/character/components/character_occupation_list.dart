import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterOccupationList extends StatelessWidget {
  const CharacterOccupationList({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ocupação:",
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
    );
  }
}
