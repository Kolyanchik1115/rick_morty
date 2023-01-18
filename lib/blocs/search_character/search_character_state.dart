part of 'search_character_bloc.dart';

abstract class SearchCharacterState extends Equatable {
  const SearchCharacterState();

  @override
  List<Object> get props => [];
}

class SearchCharacterEmpty extends SearchCharacterState {}

class PersonSearchLoading extends SearchCharacterState {}

class PersonSearchLoaded extends SearchCharacterState {
  final List<Character> persons;

  const PersonSearchLoaded({required this.persons});

  @override
  List<Object> get props => [persons];
}
