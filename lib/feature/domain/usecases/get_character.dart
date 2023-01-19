import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/repositories/character_repository.dart';

class GetCharacter {
  final CharacterRepository characterRepository;

  GetCharacter(this.characterRepository);

  Future<List<CharacterEntity>> call(int page) async {
    return await characterRepository.getCharacter(page);
  }
}
