import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/usecases/character_usecase.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacter characterRepo;
  int page = 1;

  CharacterBloc({
    required this.characterRepo,
  }) : super(const CharacterState()) {
    on<CharacterEventFetch>(_onCharacterEventFetch);
  }

  Future<void> _onCharacterEventFetch(
    CharacterEventFetch event,
    Emitter<CharacterState> emit,
  ) async {
    var oldCharacter = <CharacterEntity>[];

    if (state.status == CharacterStatus.loaded) {
      oldCharacter = state.characterLoaded;
    }

    try {
      emit(state.copyWith(oldCharacter: oldCharacter, isFirstFetch: page == 1));

      await characterRepo.getCharacter(page).then((newCharacter) {
        page++;
        final character = state.oldCharacter;
        character.addAll(newCharacter);
        emit(state.copyWith(
          characterLoaded: character,
          status: CharacterStatus.loaded,
        ));
      });
    } catch (_) {
      emit(state.copyWith(status: CharacterStatus.error));
    }
  }
}
