import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/domain/repositories/location_repository.dart';

class SearchLocation {
  final LocationRepository locationRepository;

  SearchLocation(this.locationRepository);

  Future<List<LocationEntity>> call(String query) async {
    return await locationRepository.searchLocation(query);
  }
}
