import 'package:rick_morty/feature/domain/entities/character_enitity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required id,
    required name,
    required status,
    required species,
    required type,
    required gender,
    required image,
    required episode,
    required created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          image: image,
          episode: episode,
          created: created,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      created: DateTime.parse(json['created'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'image': image,
      'episode': episode,
      'created': created.toIso8601String(),
    };
  }
}
