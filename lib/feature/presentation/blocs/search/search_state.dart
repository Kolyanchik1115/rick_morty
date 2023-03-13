// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

enum SearchStatus { loading, loaded, empty, error }

class SearchState {
  final List<LocationEntity> locations;
  final List<CharacterEntity> persons;
  final List<EpisodeEntity> episodes;
  final SearchStatus status;

  SearchState({
    this.locations = const [],
    this.persons = const [],
    this.episodes = const [],
    this.status = SearchStatus.empty,
  });

  SearchState copyWith({
    List<LocationEntity>? locations,
    List<CharacterEntity>? persons,
    List<EpisodeEntity>? episodes,
    SearchStatus? status,
  }) {
    return SearchState(
      locations: locations ?? this.locations,
      persons: persons ?? this.persons,
      episodes: episodes ?? this.episodes,
      status: status ?? this.status,
    );
  }
}


// abstract class SearchState extends Equatable {
//   const SearchState();

//   @override
//   List<Object> get props => [];
// }

// class SearchEmpty extends SearchState {}

// class SearchLoading extends SearchState {}

// class SearchLoaded extends SearchState {
//   final List<LocationEntity> locations;
//   final List<CharacterEntity> persons;
//   final List<EpisodeEntity> episodes;

//   const SearchLoaded({
//     this.locations = const [],
//     this.persons = const [],
//     this.episodes = const [],
//   });
//   @override
//   List<Object> get props => [locations, persons, episodes];
// }

// class SearchError extends SearchState {}
