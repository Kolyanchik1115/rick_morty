import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  
  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  @override
  List<Object> get props {
    return [id, name, status, species, gender, image];
  }
}
