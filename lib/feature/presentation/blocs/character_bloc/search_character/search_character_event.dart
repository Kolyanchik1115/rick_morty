part of 'search_character_bloc.dart';

abstract class SearchCharacterEvent extends Equatable {
  const SearchCharacterEvent();

  @override
  List<Object> get props => [];
}

class SearchCharacters extends SearchCharacterEvent {
  final String personQuery;

  const SearchCharacters(this.personQuery);
}
