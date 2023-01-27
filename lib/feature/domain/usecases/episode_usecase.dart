import 'package:rick_morty/feature/domain/entities/episode_entity.dart';
import 'package:rick_morty/feature/domain/repositories/episode_repository.dart';

abstract class EpisodeUseCase {
  Future<List<EpisodeEntity>> getEpisode(int page);
  Future<List<EpisodeEntity>> searchEpisode(String query);
}

class GetEpisode extends EpisodeUseCase {
  final EpisodeRepository episodeRepository;

  GetEpisode({
    required this.episodeRepository,
  });

  @override
  Future<List<EpisodeEntity>> getEpisode(int page) async {
    return await episodeRepository.getEpisode(page);
  }

  @override
  Future<List<EpisodeEntity>> searchEpisode(String query) async {
    return await episodeRepository.searchEpisode(query);
  }
}
