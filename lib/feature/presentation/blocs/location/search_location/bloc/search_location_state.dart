part of 'search_location_bloc.dart';

abstract class SearchLocationState extends Equatable {
  const SearchLocationState();

  @override
  List<Object> get props => [];
}

class SearchLocationEmpty extends SearchLocationState {}

class SearchLocationLoading extends SearchLocationState {}

class SearchLocationLoaded extends SearchLocationState {
  final List<LocationEntity> locations;

  const SearchLocationLoaded({required this.locations});

  @override
  List<Object> get props => [locations];
}

class SearchLocationError extends SearchLocationState {}
