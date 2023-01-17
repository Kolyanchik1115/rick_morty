part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationTap extends NavigationEvent {
  final NavbarItem navbarItem;

  const NavigationTap(this.navbarItem);
  @override
  List<Object> get props => [navbarItem];
}
