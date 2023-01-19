import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_morty/feature/data/models/character_model.dart';

abstract class CharacterNetwork {
  Future<List<CharacterModel>> getCharacters(int page);
  Future<List<CharacterModel>> searchCharacters(String query);
}

class CharacterRepo extends CharacterNetwork {
  @override
  Future<List<CharacterModel>> getCharacters(int page) => _getCharacterFromUrl(
      'https://rickandmortyapi.com/api/character/?page=$page');

  @override
  Future<List<CharacterModel>> searchCharacters(String query) =>
      _getCharacterFromUrl(
          'https://rickandmortyapi.com/api/character/?name=$query');

  Future<List<CharacterModel>> _getCharacterFromUrl(String url) async {
    try {
      var response = await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
      var jsonResult = json.decode(response.body);
      return (jsonResult['results'] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
