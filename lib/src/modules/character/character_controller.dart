import 'package:flutter/material.dart';

import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:breaking_bad_app/src/modules/character/quote_states.dart';
import 'package:breaking_bad_app/src/repositories/quote_repository.dart';

class CharacterController {
  final quoteRepository = QuoteRepository();

  final quoteNotifier = ValueNotifier<QuoteState>(QuoteStateEmpty());

  set quoteState(QuoteState state) => quoteNotifier.value = state;

  final CharacterModel character;
  CharacterController({
    required this.character,
  }) {
    getRandomQuote();
  }

  Future<void> getRandomQuote() async {
    quoteState = QuoteStateLoading();

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final response = await quoteRepository.getRandomQuote(
        author: character.name,
      );
      quoteState = QuoteStateSuccess(quote: response);
    } catch (e) {
      quoteState = QuoteStateError(error: e.toString());
    }
  }
}
