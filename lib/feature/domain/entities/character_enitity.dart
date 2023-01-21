import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationListEntity origin;
  final LocationListEntity location;
  final String image;
  final List<String> episode;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
      ];
}

class LocationListEntity extends Equatable {
  final String name;
  final String url;

  const LocationListEntity({required this.name, required this.url});

  @override
  List<Object?> get props => [name, url];
}
