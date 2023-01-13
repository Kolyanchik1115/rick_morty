import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/data/models/character.dart';
import 'package:rick_morty/data/repositories/character_repo.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepo characterRepo;
  CharacterBloc({
    required this.characterRepo,
  }) : super(CharacterLoading()) {
    on<CharacterEventFetch>(_onCharacterEventFetch);
  }

  Future<void> _onCharacterEventFetch(
    CharacterEventFetch event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoading());
    try {
      Character characterLoaded = await characterRepo
          .getCharacter(event.page)
          .timeout(const Duration(seconds: 3));
      emit(CharacterLoaded(characterLoaded: characterLoaded));
    } catch (_) {
      emit(CharacterError());
    }
  }
}
