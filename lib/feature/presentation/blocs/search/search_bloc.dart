import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/domain/entities/episode_entity.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/domain/usecases/character/get_character.dart';
import 'package:rick_morty/feature/domain/usecases/episode/get_episode.dart';
import 'package:rick_morty/feature/domain/usecases/location/get_location.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetCharacter characterRepo;
  final GetLocation locationRepo;
  final GetEpisode episodeRepo;

  SearchBloc({
    required this.characterRepo,
    required this.locationRepo,
    required this.episodeRepo,
  }) : super(SearchEmpty()) {
    on<SearchCharacters>(_onSearchPersons);
    on<SearchLocations>(_onSearchLocations);
    on<SearchEpisodes>(_onSearchEpisodes);
  }
  Future<void> _onSearchPersons(
    SearchCharacters event,
    Emitter<SearchState> emit,
  ) async {
    try {
      final searchPersons = await characterRepo
          .searchCharacter(event.personQuery)
          .timeout(const Duration(seconds: 3));
      emit(SearchLoaded(persons: searchPersons));
    } catch (_) {
      emit(SearchError());
    }
  }

  Future<void> _onSearchLocations(
    SearchLocations event,
    Emitter<SearchState> emit,
  ) async {
    try {
      final searchLocations = await locationRepo
          .searchLocation(event.locationQuery)
          .timeout(const Duration(seconds: 3));
      emit(SearchLoaded(locations: searchLocations));
    } catch (_) {
      emit(SearchError());
    }
  }

  Future<void> _onSearchEpisodes(
    SearchEpisodes event,
    Emitter<SearchState> emit,
  ) async {
    try {
      final searchEpisodes = await episodeRepo
          .searchEpisode(event.episodeQuery)
          .timeout(const Duration(seconds: 3));
      emit(SearchLoaded(episodes: searchEpisodes));
    } catch (_) {
      emit(SearchError());
    }
  }
}
