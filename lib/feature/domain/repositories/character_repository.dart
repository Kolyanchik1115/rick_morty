import 'package:rick_morty/feature/domain/entities/character_enitity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getCharacter(int page);
  Future<List<CharacterEntity>> searchCharacter(String query);
}
