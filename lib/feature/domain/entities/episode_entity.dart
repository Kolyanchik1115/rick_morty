import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  final int id;
  final String name;
  final String air_date;
  final String episode;
  final List<String> characters;

  const EpisodeEntity({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        air_date,
        episode,
        characters,
      ];
}
