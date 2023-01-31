import 'package:rick_morty/feature/data/datasource/api/location_api.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationNetwork remoteDataSource;

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<LocationEntity>> getLocation(int page) async {
    final remoteLocation= await remoteDataSource.getLocations(page);
    return remoteLocation;
  }

  @override
  Future<List<LocationEntity>> searchLocation(String query) async {
    final searchLocation = await remoteDataSource.searchLocations(query);
    return searchLocation;
  }
}
