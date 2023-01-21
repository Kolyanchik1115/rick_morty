import 'package:get_it/get_it.dart';
import 'package:rick_morty/feature/data/datasource/character_remote.dart';
import 'package:rick_morty/feature/data/datasource/location_remote.dart';
import 'package:rick_morty/feature/data/repository/character_repository_impl.dart';
import 'package:rick_morty/feature/data/repository/location_repository_impl.dart';
import 'package:rick_morty/feature/domain/repositories/character_repository.dart';
import 'package:rick_morty/feature/domain/repositories/location_repository.dart';
import 'package:rick_morty/feature/domain/usecases/character/get_character.dart';
import 'package:rick_morty/feature/domain/usecases/character/search_character.dart';
import 'package:rick_morty/feature/domain/usecases/location/get_location.dart';
import 'package:rick_morty/feature/domain/usecases/location/search_location.dart';
import 'package:rick_morty/feature/presentation/blocs/character/character/character_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/character/search_character/search_character_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/location/location/location_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/location/search_location/bloc/search_location_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/navigation/navigation_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CharacterBloc(characterRepo: sl()));
  sl.registerFactory(() => SearchCharacterBloc(searchCharacter: sl()));
  sl.registerFactory(() => LocationBloc(locationRepo: sl()));
  sl.registerFactory(() => SearchLocationBloc(searchLocation: sl()));

  sl.registerFactory(() => NavigationBloc());

  ///Use case
  sl.registerLazySingleton(() => GetCharacter(sl()));
  sl.registerLazySingleton(() => SearchCharacter(sl()));
  sl.registerLazySingleton(() => GetLocation(sl()));
  sl.registerLazySingleton(() => SearchLocation(sl()));

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
