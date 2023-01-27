import 'package:dio/dio.dart';
import 'package:rick_morty/common/config.dart';
import 'package:rick_morty/feature/data/datasource/dio/dio_client.dart';
import 'package:rick_morty/feature/data/datasource/dio/dio_exception.dart';
import 'package:rick_morty/feature/data/models/character_model.dart';

abstract class CharacterNetwork {
  Future<List<CharacterModel>> getCharacters(int page);
  Future<List<CharacterModel>> searchCharacters(String query);
}

class CharacterRepo implements CharacterNetwork {
  final DioClient dioClient;

  CharacterRepo({required this.dioClient});

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
    try {
      var response = await dioClient.get('${Config.character}/?page=$page');
      final characters = (response.data['results'] as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList();
      return characters;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<List<CharacterModel>> searchCharacters(String query) async {
    try {
      final response = await dioClient.get('${Config.character}/?name=$query');
      final characters = (response.data['results'] as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList();
      return characters;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
