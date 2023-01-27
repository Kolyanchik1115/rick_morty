import 'package:dio/dio.dart';
import 'package:rick_morty/common/config.dart';
import 'package:rick_morty/feature/data/datasource/dio/dio_client.dart';
import 'package:rick_morty/feature/data/datasource/dio/dio_exception.dart';
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
    try {
      var response = await dioClient.get('${Config.location}/?page=$page');
      final locations = (response.data['results'] as List)
          .map((e) => LocationModel.fromJson(e))
          .toList();
      return locations;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<List<LocationModel>> searchLocations(String query) async {
    try {
      final response = await dioClient.get('${Config.location}/?name=$query');
      final locations = (response.data['results'] as List)
          .map((e) => LocationModel.fromJson(e))
          .toList();
      return locations;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
