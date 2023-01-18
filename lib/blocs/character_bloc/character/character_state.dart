part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characterLoaded;
  const CharacterLoaded({
    required this.characterLoaded,
  });
  @override
  List<Object> get props => [characterLoaded];
}

class CharacterError extends CharacterState {}
