import 'dart:developer';

import 'package:breaking_bad_app/src/models/quote_model.dart';
import 'package:dio/dio.dart';

class QuoteRepository {
  final dio = Dio(
    BaseOptions(baseUrl: "https://www.breakingbadapi.com"),
  );

  Future<QuoteModel> getRandomQuote({
    String? author,
  }) async {
    try {
      Map<String, dynamic>? query;

      if (author != null) {
        query = {
          "author": author,
        };
      }
      final response = await dio.get(
        "/api/quote/random",
        queryParameters: query,
      );

      log(
        response.realUri.toString(),
        name: response.statusCode.toString(),
      );

      final data = List.from(response.data);

      if (data.isEmpty) throw "Nenhuma frase encontrada";

      final character = QuoteModel.fromMap(data.first);
      return character;
    } catch (e) {
      rethrow;
    }
  }
}
