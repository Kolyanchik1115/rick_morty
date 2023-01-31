import 'package:rick_morty/feature/data/datasource/dio/dio_client.dart';
import 'package:rick_morty/feature/data/models/location_model.dart';

abstract class LocationNetwork {
  Future<List<LocationModel>> getLocations(int page);
  Future<List<LocationModel>> searchLocations(String query);
}

class LocationRepo implements LocationNetwork {
  final DioClient dioClient;

  LocationRepo({required this.dioClient});

  @override
  Future<List<LocationModel>> getLocations(int page) async {

    final response = await dioClient.get(
      '/location',
      queryParameters: {
        'page': page.toString(),
      },
    );
    final locations = (response.data['results'] as List)
        .map((e) => LocationModel.fromJson(e))
        .toList();
    return locations;
  }

  @override
  Future<List<LocationModel>> searchLocations(String query) async {
    final response = await dioClient.get(
      '/location',
      queryParameters: {
        'name': query.toString(),
      },
    );
    final locations = (response.data['results'] as List)
        .map((e) => LocationModel.fromJson(e))
        .toList();
    return locations;
  }
}
