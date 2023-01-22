part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}
class SearchLocations extends SearchEvent {
  final String locationQuery;

  const SearchLocations(this.locationQuery);
}
class SearchCharacters extends SearchEvent {
  final String personQuery;

  const SearchCharacters(this.personQuery);
}
