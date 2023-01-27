import 'package:dio/dio.dart' as dio;
import 'package:get_it/get_it.dart';
import 'package:rick_morty/feature/data/datasource/api/character_api.dart';
import 'package:rick_morty/feature/data/datasource/api/episode_api.dart';
import 'package:rick_morty/feature/data/datasource/api/location_remote.dart';
import 'package:rick_morty/feature/data/datasource/dio/dio_client.dart';
import 'package:rick_morty/feature/data/repository/character_repository_impl.dart';
import 'package:rick_morty/feature/data/repository/episode_repository_impl.dart';
import 'package:rick_morty/feature/data/repository/location_repository_impl.dart';
import 'package:rick_morty/feature/domain/repositories/character_repository.dart';
import 'package:rick_morty/feature/domain/repositories/episode_repository.dart';
import 'package:rick_morty/feature/domain/repositories/location_repository.dart';
import 'package:rick_morty/feature/domain/usecases/character_usecase.dart';
import 'package:rick_morty/feature/domain/usecases/episode_usecase.dart';
import 'package:rick_morty/feature/domain/usecases/location_usecase.dart';
import 'package:rick_morty/feature/presentation/blocs/character/character_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/episode/episode_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/location/location_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/search/search_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CharacterBloc(characterRepo: sl()));
  sl.registerFactory(() => LocationBloc(locationRepo: sl()));
  sl.registerFactory(() => EpisodeBloc(episodeRepo: sl()));
  sl.registerFactory(() => SearchBloc(
        locationRepo: sl(),
        characterRepo: sl(),
        episodeRepo: sl(),
      ));
  sl.registerFactory(() => NavigationBloc());

//////
  sl.registerLazySingleton(() => GetCharacter(characterRepository: sl()));
  sl.registerLazySingleton(() => GetLocation(locationRepository: sl()));
  sl.registerLazySingleton(() => GetEpisode(episodeRepository: sl()));

//////
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<EpisodeRepository>(
    () => EpisodeRepositoryImpl(remoteDataSource: sl()),
  );
  //////
  ///
  sl.registerLazySingleton<CharacterNetwork>(
      () => CharacterRepo(dioClient: sl()));
  sl.registerLazySingleton<LocationNetwork>(
      () => LocationRepo(dioClient: sl()));
  sl.registerLazySingleton<EpisodeNetwork>(
      () => EpisodeRepo(dioClient: sl()));

  /////
  sl.registerSingleton(DioClient(dio.Dio()));
}
