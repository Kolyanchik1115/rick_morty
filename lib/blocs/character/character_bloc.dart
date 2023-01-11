import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/data/models/character.dart';
import 'package:rick_morty/data/repositories/character_repo.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  int page = 1;
  final CharacterRepo characterRepo;
  CharacterBloc({
    required this.characterRepo,
  }) : super(CharacterInitialize()) {
    on<CharacterEventFetch>(_onCharacterEventFetch);
    // on<UpdateCharacterList>(_onUpdateCharacterList);
  }

  Future<void> _onCharacterEventFetch(
    CharacterEventFetch event,
    Emitter<CharacterState> emit,
  ) async {
    // if (state is CharacterLoading) return;
    // final currentState = state;

    // var oldCharacter = <Character>[];
    // if (currentState is CharacterLoaded) {
    //   oldCharacter = currentState.characterLoaded as List<Character>;
    // }
    // emit(CharacterLoading());
    try {
      Character characterLoaded = await characterRepo
          .getCharacter(event.page)
          .timeout(const Duration(seconds: 3));
      emit(CharacterLoaded(characterLoaded: characterLoaded));
    } catch (_) {
      emit(CharacterError());
    }
  }

  // void _onUpdateCharacterList(
  //   UpdateCharacterList event,
  //   Emitter<CharacterState> emit,
  // ) {
  //   if(event.page < )
  //   emit()
  // }
}
