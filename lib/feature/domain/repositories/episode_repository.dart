import 'package:rick_morty/feature/domain/entities/episode_entity.dart';

abstract class EpisodeRepository {
  Future<List<EpisodeEntity>> getEpisode(int page);
  Future<List<EpisodeEntity>> searchEpisode(String query);
}