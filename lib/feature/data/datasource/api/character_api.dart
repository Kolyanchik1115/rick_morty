import 'package:rick_morty/feature/data/datasource/dio/dio_client.dart';
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
    final response = await dioClient.get(
      '/character',
      queryParameters: {
        'page': page.toString(),
      },
    );
    
    final characters = (response.data['results'] as List)
        .map((e) => CharacterModel.fromJson(e))
        .toList();
    return characters;
  }

  @override
  Future<List<CharacterModel>> searchCharacters(String query) async {
    final response = await dioClient.get(
      '/character',
      queryParameters: {
        'name': query.toString(),
      },
    );
    
    final characters = (response.data['results'] as List)
        .map((e) => CharacterModel.fromJson(e))
        .toList();
    return characters;
  }
}
