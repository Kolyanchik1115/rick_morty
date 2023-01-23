part of 'episode_bloc.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object> get props => [];
}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {
  final List<EpisodeEntity> oldEpisode;
  final bool isFirstFetch;

  const EpisodeLoading(this.oldEpisode, {this.isFirstFetch = false});
}

class EpisodeLoaded extends EpisodeState {
  final List<EpisodeEntity> episodeLoaded;
  const EpisodeLoaded({
    required this.episodeLoaded,
  });
  @override
  List<Object> get props => [episodeLoaded];
}

class EpisodeError extends EpisodeState {}
