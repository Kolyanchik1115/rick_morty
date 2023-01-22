import 'package:get_it/get_it.dart';
import 'package:rick_morty/feature/data/datasource/character_remote.dart';
import 'package:rick_morty/feature/data/datasource/location_remote.dart';
import 'package:rick_morty/feature/data/repository/character_repository_impl.dart';
import 'package:rick_morty/feature/data/repository/location_repository_impl.dart';
import 'package:rick_morty/feature/domain/repositories/character_repository.dart';
import 'package:rick_morty/feature/domain/repositories/location_repository.dart';
import 'package:rick_morty/feature/domain/usecases/character/get_character.dart';
import 'package:rick_morty/feature/domain/usecases/location/get_location.dart';
import 'package:rick_morty/feature/presentation/blocs/character/character_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/location/location_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/search/search_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CharacterBloc(characterRepo: sl()));
  sl.registerFactory(() => SearchBloc(
        locationRepo: sl(),
        characterRepo: sl(),
      ));
  sl.registerFactory(() => LocationBloc(locationRepo: sl()));

  sl.registerFactory(() => NavigationBloc());

  ///Use case

  sl.registerLazySingleton(() => GetCharacter(characterRepository: sl()));
  sl.registerLazySingleton(() => GetLocation(locationRepository: sl()));

  ///Repository
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(remoteDataSource: sl()),
  );
  //////
  sl.registerLazySingleton<CharacterNetwork>(() => CharacterRepo());
  sl.registerLazySingleton<LocationNetwork>(() => LocationRepo());
}
