import 'package:breaking_bad_app/src/models/quote_model.dart';

abstract class QuoteState {}

class QuoteStateEmpty extends QuoteState {}

class QuoteStateLoading extends QuoteState {}

class QuoteStateSuccess extends QuoteState {
  final QuoteModel quote;
  QuoteStateSuccess({
    required this.quote,
  });
}

class QuoteStateError extends QuoteState {
  final String error;
  QuoteStateError({
    required this.error,
  });
}
