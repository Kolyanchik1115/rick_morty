part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {
  final List<LocationEntity> oldLocation;
  final bool isFirstFetch;

  const LocationLoading(this.oldLocation, {this.isFirstFetch = false});
}

class LocationLoaded extends LocationState {
  final List<LocationEntity> locationLoaded;
  const LocationLoaded({
    required this.locationLoaded,
  });
  @override
  List<Object> get props => [locationLoaded];
}

class LocationError extends LocationState {}
