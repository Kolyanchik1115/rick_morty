import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/repositories/character_repository.dart';

class SearchCharacter {
  final CharacterRepository characterRepository;

  SearchCharacter(this.characterRepository);

  Future<List<CharacterEntity>> call(String query) async {
    return await characterRepository.searchCharacter(query);
  }
}
