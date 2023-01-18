import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/data/models/character.dart';
import 'package:rick_morty/data/repositories/character_repo.dart';

part 'search_character_event.dart';
part 'search_character_state.dart';

class SearchCharacterBloc
    extends Bloc<SearchCharacterEvent, SearchCharacterState> {
  int page = 1;
  final CharacterRepo searchPerson;

  SearchCharacterBloc({required this.searchPerson})
      : super(SearchCharacterEmpty()) {
    on<SearchPersons>(_onSearchPersons);
  }
  Future<void> _onSearchPersons(
    SearchPersons event,
    Emitter<SearchCharacterState> emit,
  ) async {
    try {
      final searchPersons = await searchPerson
          .searchCharacter(page, event.personQuery)
          .timeout(const Duration(seconds: 3));
      emit(PersonSearchLoaded(persons: searchPersons));
      page++;
    } catch (_) {
      emit(SearchError());
    }
  }
}
