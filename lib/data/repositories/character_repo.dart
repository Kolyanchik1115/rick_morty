import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_morty/data/models/character.dart';

class CharacterRepo {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter(int page) async {
    try {
      var response = await http.get(Uri.parse('$url?page=$page'));
      var jsonResult = json.decode(response.body);
      return Character.fromJson(jsonResult);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
