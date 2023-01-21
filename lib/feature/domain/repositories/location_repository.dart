import 'package:rick_morty/feature/domain/entities/location_enitity.dart';

abstract class LocationRepository {
  Future<List<LocationEntity>> getLocation(int page);
  Future<List<LocationEntity>> searchLocation(String query);
}
