import 'package:json_annotation/json_annotation.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required id,
    required name,
    required status,
    required species,
    required gender,
    required image,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          gender: gender,
          image: image,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
