import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/episode_entity.dart';
import 'package:rick_morty/feature/domain/usecases/episode/get_episode.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisode episodeRepo;

  int page = 1;
  EpisodeBloc({
    required this.episodeRepo,
  }) : super(EpisodeInitial()) {
    on<EpisodeEventFetch>(_onLocationEventFetch);
  }

  Future<void> _onLocationEventFetch(
    EpisodeEventFetch event,
    Emitter<EpisodeState> emit,
  ) async {
    if (state is EpisodeLoading) return;

    final currentState = state;

    var oldEpisode = <EpisodeEntity>[];

    if (currentState is EpisodeLoaded) {
      oldEpisode = currentState.episodeLoaded;
    }

    try {
      emit(EpisodeLoading(oldEpisode, isFirstFetch: page == 1));

      await episodeRepo.getEpisode(page).then((newCharacter) {
        page++;
        final episode = (state as EpisodeLoading).oldEpisode;
        episode.addAll(newCharacter);
        emit(EpisodeLoaded(episodeLoaded: episode));
      });
    } catch (_) {
      emit(EpisodeError());
    }
  }
}
