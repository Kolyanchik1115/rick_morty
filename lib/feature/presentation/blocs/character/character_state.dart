part of 'character_bloc.dart';

enum CharacterStatus { loading, loaded, error }

class CharacterState {
  
  final List<CharacterEntity> oldCharacter;
  final List<CharacterEntity> characterLoaded;
  final CharacterStatus status;
  final bool isFirstFetch;

  const CharacterState({
    this.oldCharacter = const [],
    this.characterLoaded = const [],
    this.status = CharacterStatus.loading,
    this.isFirstFetch = false,
  });

  CharacterState copyWith({
    List<CharacterEntity>? oldCharacter,
    List<CharacterEntity>? characterLoaded,
    CharacterStatus? status,
    bool? isFirstFetch,
  }) {
    return CharacterState(
      oldCharacter: oldCharacter ?? this.oldCharacter,
      characterLoaded: characterLoaded ?? this.characterLoaded,
      status: status ?? this.status,
      isFirstFetch: isFirstFetch ?? this.isFirstFetch,
    );
  }
}



// abstract class CharacterState extends Equatable {
//   const CharacterState();

//   @override
//   List<Object> get props => [];
// }

// class CharacterInitial extends CharacterState {}

// class CharacterLoading extends CharacterState {
//   final List<CharacterEntity> oldCharacter;
//   final bool isFirstFetch;

//   const CharacterLoading(this.oldCharacter, {this.isFirstFetch = false});
// }

// class CharacterLoaded extends CharacterState {
//   final List<CharacterEntity> characterLoaded;
//   const CharacterLoaded({
//     required this.characterLoaded,
//   });
//   @override
//   List<Object> get props => [characterLoaded];
// }

// class CharacterError extends CharacterState {}
