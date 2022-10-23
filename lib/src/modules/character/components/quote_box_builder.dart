import 'package:breaking_bad_app/src/core/core.dart';
import 'package:breaking_bad_app/src/modules/character/components/quote_box.dart';
import 'package:breaking_bad_app/src/modules/character/quote_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuoteBoxBuilder extends StatelessWidget {
  const QuoteBoxBuilder({
    Key? key,
    required this.valueListenable,
    required this.onGenerateNewQuote,
  }) : super(key: key);

  final ValueListenable<QuoteState> valueListenable;

  final VoidCallback onGenerateNewQuote;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<QuoteState>(
      valueListenable: valueListenable,
      builder: (context, state, _) {
        if (state.runtimeType == QuoteStateLoading) {
          return const QuoteBox();
        } else if (state.runtimeType == QuoteStateSuccess) {
          final quoteState = state as QuoteStateSuccess;
          final quote = quoteState.quote;
          return Column(
            children: [
              QuoteBox(
                quote: quote.quote,
                author: quote.author,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: onGenerateNewQuote,
                child: const Text("Gerar nova frase"),
              ),
            ],
          );
        } else if (state.runtimeType == QuoteStateError) {
          final quoteState = state as QuoteStateError;

          return Column(
            children: [
              Text(
                quoteState.error,
                style: AppTextStyles.titleSmall(context)?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: onGenerateNewQuote,
                child: const Text("Tentar novamente"),
              ),
            ],
          );
        }

        return ElevatedButton(
          onPressed: onGenerateNewQuote,
          child: const Text("Gerar frase aleatória"),
        );
      },
    );
  }
}
