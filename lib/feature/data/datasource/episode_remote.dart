import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_morty/feature/data/models/episode_model.dart';

abstract class EpisodeNetwork {
  Future<List<EpisodeModel>> getEpisode(int page);
  // Future<List<EpisodeModel>> getTabsEpisode(List<int> page);

  Future<List<EpisodeModel>> searchEpisode(String query);
}

class EpisodeRepo extends EpisodeNetwork {
  // @override
  // Future<List<EpisodeModel>> getTabsEpisode(List<int> page) =>
  //     _getEpisodeFromUrl('https://rickandmortyapi.com/api/episode/?page=$page');

  @override
  Future<List<EpisodeModel>> getEpisode(int page) =>
      _getEpisodeFromUrl('https://rickandmortyapi.com/api/episode/?page=$page');

  @override
  Future<List<EpisodeModel>> searchEpisode(String query) => _getEpisodeFromUrl(
      'https://rickandmortyapi.com/api/episode/?name=$query');

  Future<List<EpisodeModel>> _getEpisodeFromUrl(String url) async {
    try {
      var response = await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
      var jsonResult = json.decode(response.body);
      return (jsonResult['results'] as List)
          .map((json) => EpisodeModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
