import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/usecases/character/get_character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacter characterRepo;
  int page = 1;

  CharacterBloc({
    required this.characterRepo,
  }) : super(CharacterInitial()) {
    on<CharacterEventFetch>(_onCharacterEventFetch);
  }

  Future<void> _onCharacterEventFetch(
    CharacterEventFetch event,
    Emitter<CharacterState> emit,
  ) async {
    if (state is CharacterLoading) return;

    final currentState = state;

    var oldCharacter = <CharacterEntity>[];

    if (currentState is CharacterLoaded) {
      oldCharacter = currentState.characterLoaded;
    }

    try {
      emit(CharacterLoading(oldCharacter, isFirstFetch: page == 1));

      await characterRepo.getCharacter(page).then((newCharacter) {
        page++;
        final character = (state as CharacterLoading).oldCharacter;
        character.addAll(newCharacter);
        emit(CharacterLoaded(characterLoaded: character));
      });
    } catch (_) {
      emit(CharacterError());
    }
  }
}
