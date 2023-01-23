import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/domain/usecases/location/get_location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocation locationRepo;

  int page = 1;
  LocationBloc({
    required this.locationRepo,
  }) : super(LocationInitial()) {
    on<LocationEventFetch>(_onLocationEventFetch);
  }

  Future<void> _onLocationEventFetch(
    LocationEventFetch event,
    Emitter<LocationState> emit,
  ) async {
    if (state is LocationLoading) return;

    final currentState = state;

    var oldLocation = <LocationEntity>[];

    if (currentState is LocationLoaded) {
      oldLocation = currentState.locationLoaded;
    }
    try {
      emit(LocationLoading(oldLocation, isFirstFetch: page == 1));

      await locationRepo.getLocation(page).then((newCharacter) {
        page++;
        final location = (state as LocationLoading).oldLocation;
        location.addAll(newCharacter);
        emit(LocationLoaded(locationLoaded: location));
      });
    } catch (_) {
      emit(LocationError());
    }
  }
}
