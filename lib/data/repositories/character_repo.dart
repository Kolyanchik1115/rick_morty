import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_morty/data/models/character.dart';

class CharacterRepo {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<List<Character>> getCharacter(int page) async {
    try {
      var response = await http.get(Uri.parse('$url?page=$page'));
      var jsonResult = json.decode(response.body);
      return (jsonResult['results'] as List)
          .map((json) => Character.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
