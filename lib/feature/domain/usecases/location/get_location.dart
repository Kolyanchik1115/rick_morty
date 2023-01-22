import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/domain/repositories/location_repository.dart';

abstract class LocationUseCase {
  Future<List<LocationEntity>> getLocation(int page);
  Future<List<LocationEntity>> searchLocation(String query);
}

class GetLocation extends LocationUseCase {
  final LocationRepository locationRepository;

  GetLocation({
    required this.locationRepository,
  });

  @override
  Future<List<LocationEntity>> getLocation(int page) async {
    return await locationRepository.getLocation(page);
  }

  @override
  Future<List<LocationEntity>> searchLocation(String query) async {
    return await locationRepository.searchLocation(query);
  }
}
