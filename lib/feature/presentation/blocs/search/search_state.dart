part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<LocationEntity> locations;
  final List<CharacterEntity> persons;
  final List<EpisodeEntity> episodes;

  const SearchLoaded({
    this.locations = const [],
    this.persons = const [],
    this.episodes = const [],
  });
  @override
  List<Object> get props => [locations, persons, episodes];
}

class SearchError extends SearchState {}
