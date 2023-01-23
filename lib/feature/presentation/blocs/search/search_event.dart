part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchLocations extends SearchEvent {
  final String locationQuery;

  const SearchLocations(this.locationQuery);
  @override
  List<Object> get props => [locationQuery];
}

class SearchCharacters extends SearchEvent {
  final String personQuery;

  const SearchCharacters(this.personQuery);
  @override
  List<Object> get props => [personQuery];
}

class SearchEpisodes extends SearchEvent {
  final String episodeQuery;

  const SearchEpisodes(this.episodeQuery);
  @override
  List<Object> get props => [episodeQuery];
}
