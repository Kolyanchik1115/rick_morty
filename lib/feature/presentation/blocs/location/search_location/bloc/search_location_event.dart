part of 'search_location_bloc.dart';

abstract class SearchLocationEvent extends Equatable {
  const SearchLocationEvent();

  @override
  List<Object> get props => [];
}
class SearchLocations extends SearchLocationEvent {
  final String locationQuery;

  const SearchLocations(this.locationQuery);
}
