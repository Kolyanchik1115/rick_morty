part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class CharacterEventFetch extends CharacterEvent {
  final int page;
  const CharacterEventFetch({
    required this.page,
  });
  @override
  List<Object> get props => [page];
}
