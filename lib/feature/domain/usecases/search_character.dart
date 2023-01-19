import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/repositories/character_repository.dart';

class SearchAllCharacter {
  final CharacterRepository characterRepository;

  SearchAllCharacter(this.characterRepository);

  Future<List<CharacterEntity>> call(String query) async {
    return await characterRepository.searchCharacter(query);
  }
}
