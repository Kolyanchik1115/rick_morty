import 'package:rick_morty/feature/data/datasource/dio/dio_client.dart';
import 'package:rick_morty/feature/data/models/episode_model.dart';

abstract class EpisodeNetwork {
  Future<List<EpisodeModel>> getEpisode(int page);

  Future<List<EpisodeModel>> searchEpisode(String query);
}

class EpisodeRepo implements EpisodeNetwork {
  final DioClient dioClient;

  EpisodeRepo({required this.dioClient});

  @override
  Future<List<EpisodeModel>> getEpisode(int page) async {
    final response = await dioClient.get(
      '/episode',
      queryParameters: {
        'page': page.toString(),
      },
    );
    final episodes = (response.data['results'] as List)
        .map((e) => EpisodeModel.fromJson(e))
        .toList();
    return episodes;
  }

  @override
  Future<List<EpisodeModel>> searchEpisode(String query) async {
    final response = await dioClient.get(
      '/episode',
      queryParameters: {
        'name': query.toString(),
      },
    );
    final episodes = (response.data['results'] as List)
        .map((e) => EpisodeModel.fromJson(e))
        .toList();
    return episodes;
  }
}
