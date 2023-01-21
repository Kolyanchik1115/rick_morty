import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/domain/usecases/location/search_location.dart';

part 'search_location_event.dart';
part 'search_location_state.dart';

class SearchLocationBloc
    extends Bloc<SearchLocationEvent, SearchLocationState> {
  final SearchLocation searchLocation;

  SearchLocationBloc({required this.searchLocation})
      : super(SearchLocationEmpty()) {
    on<SearchLocations>(_onSearchLocations);
  }
  Future<void> _onSearchLocations(
    SearchLocations event,
    Emitter<SearchLocationState> emit,
  ) async {
    try {
      final searchLocations = await searchLocation(event.locationQuery)
          .timeout(const Duration(seconds: 3));
      emit(SearchLocationLoaded(locations: searchLocations));
    } catch (_) {
      emit(SearchLocationError());
    }
  }
}
