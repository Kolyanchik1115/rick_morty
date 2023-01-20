import 'package:get_it/get_it.dart';
import 'package:rick_morty/feature/data/datasource/character_remote.dart';
import 'package:rick_morty/feature/data/repository/character_repository_impl.dart';
import 'package:rick_morty/feature/domain/repositories/character_repository.dart';
import 'package:rick_morty/feature/domain/usecases/get_character.dart';
import 'package:rick_morty/feature/domain/usecases/search_character.dart';
import 'package:rick_morty/feature/presentation/blocs/character_bloc/character/character_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/character_bloc/search_character/search_character_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/navigation/navigation_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CharacterBloc(characterRepo: sl()));
  sl.registerFactory(() => SearchCharacterBloc(searchCharacter: sl()));
  sl.registerFactory(() => NavigationBloc());

  ///Use case
  sl.registerLazySingleton(() => GetCharacter(sl()));
  sl.registerLazySingleton(() => SearchCharacter(sl()));

  ///Repository
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<CharacterNetwork>(() => CharacterRepo());
}
