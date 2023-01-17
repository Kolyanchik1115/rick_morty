import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(NavbarItem.characters, 0)) {
    on<NavigationTap>(_onNavigationTap);
  }
  void _onNavigationTap(
    NavigationTap event,
    Emitter<NavigationState> emit,
  ) {
    switch (event.navbarItem) {
      case NavbarItem.characters:
        emit(const NavigationState(NavbarItem.characters, 0));
        break;
      case NavbarItem.locations:
        emit(const NavigationState(NavbarItem.locations, 1));
        break;
      case NavbarItem.episodes:
        emit(const NavigationState(NavbarItem.episodes, 2));
        break;
      case NavbarItem.settings:
        emit(const NavigationState(NavbarItem.settings, 3));
        break;
    }
  }
}
