import 'package:rick_morty/feature/domain/entities/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  const EpisodeModel({
    required id,
    required name,
    required air_date,
    required episode,
    required characters,
  }) : super(
          id: id,
          name: name,
          air_date: air_date,
          episode: episode,
          characters: characters,
        );

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      air_date: json['air_date'] as String,
      episode: json['episode'] as String,
      characters:
          (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'air_date': air_date,
      'episode': episode,
      'characters': characters,
    };
  }
}
