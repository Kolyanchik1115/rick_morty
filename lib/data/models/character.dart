import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  final Info info;
  final List<Results> results;
  Character({
    required this.info,
    required this.results,
  });
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@JsonSerializable()
class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  Info({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });
  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Results {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  Results({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
