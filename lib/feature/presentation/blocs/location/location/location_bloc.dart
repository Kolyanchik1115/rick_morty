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
  }) : super(LocationLoading()) {
    on<LocationEventFetch>(_onCharacterEventFetch);
  }

  Future<void> _onCharacterEventFetch(
    LocationEventFetch event,
    Emitter<LocationState> emit,
  ) async {
    try {
      final locationLoaded =
          await locationRepo(page).timeout(const Duration(seconds: 3));
      emit(LocationLoaded(locationLoaded: locationLoaded));
      page++;
    } catch (_) {
      emit(LocationError());
    }
  }
}
