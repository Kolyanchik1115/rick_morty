import 'package:rick_morty/feature/data/datasource/api/character_api.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterNetwork remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CharacterEntity>> getCharacter(int page) async {
    final remoteCharacter = await remoteDataSource.getCharacters(page);
    return remoteCharacter;
  }

  @override
  Future<List<CharacterEntity>> searchCharacter(String query) async {
    final searchCharacter = await remoteDataSource.searchCharacters(query);
    return searchCharacter;
  }
}
