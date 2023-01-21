import 'package:rick_morty/feature/data/datasource/location_remote.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/domain/repositories/location_repository.dart';

class GetLocation {
  final LocationRepository locationRepository;

  GetLocation(this.locationRepository);

  Future<List<LocationEntity>> call(int page) async {
    return await locationRepository.getLocation(page);
  }
}
