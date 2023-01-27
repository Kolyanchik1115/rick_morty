import 'package:rick_morty/feature/data/datasource/api/episode_api.dart';
import 'package:rick_morty/feature/domain/entities/episode_entity.dart';
import 'package:rick_morty/feature/domain/repositories/episode_repository.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeNetwork remoteDataSource;

  EpisodeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<EpisodeEntity>> getEpisode(int page) async {
    final remoteCharacter = await remoteDataSource.getEpisode(page);
    return remoteCharacter;
  }

  @override
  Future<List<EpisodeEntity>> searchEpisode(String query) async {
    final searchCharacter = await remoteDataSource.searchEpisode(query);
    return searchCharacter;
  }
}
