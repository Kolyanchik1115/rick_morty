import 'package:dio/dio.dart';
import 'package:rick_morty/common/config.dart';
import 'package:rick_morty/feature/data/datasource/dio/dio_client.dart';
import 'package:rick_morty/feature/data/datasource/dio/dio_exception.dart';
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
    try {
      var response = await dioClient.get('${Config.episode}/?page=$page');
      final episodes = (response.data['results'] as List)
          .map((e) => EpisodeModel.fromJson(e))
          .toList();
      return episodes;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<List<EpisodeModel>> searchEpisode(String query) async {
    try {
      final response = await dioClient.get('${Config.episode}/?name=$query');
      final episodes = (response.data['results'] as List)
          .map((e) => EpisodeModel.fromJson(e))
          .toList();
      return episodes;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}

