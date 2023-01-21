part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<LocationEntity> locationLoaded;
  const LocationLoaded({
    required this.locationLoaded,
  });
  @override
  List<Object> get props => [locationLoaded];
}

class LocationError extends LocationState {}
