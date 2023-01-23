part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {
  final List<CharacterEntity> oldCharacter;
  final bool isFirstFetch;

  const CharacterLoading(this.oldCharacter, {this.isFirstFetch = false});
}

class CharacterLoaded extends CharacterState {
  final List<CharacterEntity> characterLoaded;
  const CharacterLoaded({
    required this.characterLoaded,
  });
  @override
  List<Object> get props => [characterLoaded];
}

class CharacterError extends CharacterState {}
