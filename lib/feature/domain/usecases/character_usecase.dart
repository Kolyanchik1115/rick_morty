import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/repositories/character_repository.dart';

abstract class CharacterUseCase {
  Future<List<CharacterEntity>> getCharacter(int page);
  Future<List<CharacterEntity>> searchCharacter(String query);
}

class GetCharacter extends CharacterUseCase {
  final CharacterRepository characterRepository;

  GetCharacter({
    required this.characterRepository,
  });

  @override
  Future<List<CharacterEntity>> getCharacter(int page) async {
    return await characterRepository.getCharacter(page);
  }

  @override
  Future<List<CharacterEntity>> searchCharacter(String query) async {
    return await characterRepository.searchCharacter(query);
  }
}
