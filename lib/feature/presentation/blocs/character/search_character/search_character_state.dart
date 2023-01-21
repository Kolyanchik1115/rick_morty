part of 'search_character_bloc.dart';

abstract class SearchCharacterState extends Equatable {
  const SearchCharacterState();

  @override
  List<Object> get props => [];
}

class SearchCharacterEmpty extends SearchCharacterState {}

class PersonSearchLoading extends SearchCharacterState {}

class PersonSearchLoaded extends SearchCharacterState {
  final List<CharacterEntity> persons;

  const PersonSearchLoaded({required this.persons});

  @override
  List<Object> get props => [persons];
}

class SearchError extends SearchCharacterState {}
