part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitialize extends CharacterState {}

class CharacterLoading extends CharacterState {
  final List<Character> characterLoading;
  final bool isFirstFetch;

  const CharacterLoading(
    this.characterLoading, {
    this.isFirstFetch = false,
  });
}

class CharacterLoaded extends CharacterState {
  final Character characterLoaded;
  const CharacterLoaded({
    required this.characterLoaded,
  });
  @override
  List<Object> get props => [characterLoaded];
}

class CharacterError extends CharacterState {}
