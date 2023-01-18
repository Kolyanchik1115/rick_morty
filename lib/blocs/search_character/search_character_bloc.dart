import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/data/models/character.dart';
import 'package:rick_morty/data/repositories/character_repo.dart';

part 'search_character_event.dart';
part 'search_character_state.dart';

class SearchCharacterBloc
    extends Bloc<SearchCharacterEvent, SearchCharacterState> {
  final CharacterRepo searchPerson;

  SearchCharacterBloc({required this.searchPerson})
      : super(SearchCharacterEmpty()) {
    on<SearchPersons>(_onEvent);
  }

  Future<void> _onEvent(
      SearchPersons event, Emitter<SearchCharacterState> emit) async {
    emit(PersonSearchLoading());
    final failureOrPerson =
        await searchPerson.searchCharacter(event.personQuery);
    emit(PersonSearchLoaded(persons: failureOrPerson));
  }
}
