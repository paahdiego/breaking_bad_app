import 'dart:developer';

import 'package:breaking_bad_app/src/models/character_model.dart';
import 'package:dio/dio.dart';

class CharacterRepository {
  final dio = Dio(
    BaseOptions(baseUrl: "https://www.breakingbadapi.com"),
  );

  Future<CharacterModel> getRandomCharacter() async {
    try {
      final response = await dio.get("/api/character/random");

      log(
        response.realUri.toString(),
        name: response.statusCode.toString(),
      );

      final data = List.from(response.data);

      final character = CharacterModel.fromMap(data.first);
      return character;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CharacterModel>> getCharacters({
    required int pageKey,
    required int pageSize,
    String? search,
  }) async {
    try {
      final response = await dio.get(
        "/api/characters",
        queryParameters: {
          "limit": pageSize,
          "offset": pageKey * pageSize,
        },
      );

      log(
        response.realUri.toString(),
        name: response.statusCode.toString(),
      );

      final data = List.from(response.data);

      final characters =
          data.map((element) => CharacterModel.fromMap(element)).toList();

      return characters;
    } catch (e) {
      rethrow;
    }
  }
}
