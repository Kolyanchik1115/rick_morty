import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_morty/common/config.dart';
import 'package:rick_morty/feature/data/models/location_model.dart';

abstract class LocationNetwork {
  Future<List<LocationModel>> getLocations(int page);
  Future<List<LocationModel>> searchLocations(String query);
}

class LocationRepo extends LocationNetwork {
  @override
  Future<List<LocationModel>> getLocations(int page) => _getLocationFromUrl(
      '${Confing.host}/location/?page=$page');

  @override
  Future<List<LocationModel>> searchLocations(String query) =>
      _getLocationFromUrl(
          '${Confing.host}/location/?name=$query');

  Future<List<LocationModel>> _getLocationFromUrl(String url) async {
    try {
      var response = await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
      var jsonResult = json.decode(response.body);
      return (jsonResult['results'] as List)
          .map((json) => LocationModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
