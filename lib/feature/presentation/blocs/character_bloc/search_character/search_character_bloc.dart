import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/usecases/get_character.dart';
import 'package:rick_morty/feature/domain/usecases/search_character.dart';

part 'search_character_event.dart';
part 'search_character_state.dart';

class SearchCharacterBloc
    extends Bloc<SearchCharacterEvent, SearchCharacterState> {
  final SearchCharacter searchCharacter;

  SearchCharacterBloc({required this.searchCharacter})
      : super(SearchCharacterEmpty()) {
    on<SearchCharacters>(_onSearchPersons);
  }
  Future<void> _onSearchPersons(
    SearchCharacters event,
    Emitter<SearchCharacterState> emit,
  ) async {
    try {
      final searchPersons = await searchCharacter(event.personQuery)
          .timeout(const Duration(seconds: 3));
      emit(PersonSearchLoaded(persons: searchPersons));
    } catch (_) {
      emit(SearchError());
    }
  }
}
