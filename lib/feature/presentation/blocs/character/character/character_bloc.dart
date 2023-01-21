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
  }) : super(CharacterLoading()) {
    on<CharacterEventFetch>(_onCharacterEventFetch);
  }

  Future<void> _onCharacterEventFetch(
    CharacterEventFetch event,
    Emitter<CharacterState> emit,
  ) async {
    try {
      final characterLoaded =
          await characterRepo(page).timeout(const Duration(seconds: 3));
      emit(CharacterLoaded(characterLoaded: characterLoaded));
      page++;
    } catch (_) {
      emit(CharacterError());
    }
  }
}
