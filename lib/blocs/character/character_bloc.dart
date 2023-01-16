import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/data/models/character.dart';
import 'package:rick_morty/data/repositories/character_repo.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepo characterRepo;
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
      final characterLoaded = await characterRepo
          .getCharacter(page)
          .timeout(const Duration(seconds: 3));
      emit(CharacterLoaded(characterLoaded: characterLoaded));
      page++;
    } catch (_) {
      emit(CharacterError());
    }
  }
}
