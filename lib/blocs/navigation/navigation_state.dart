part of 'navigation_bloc.dart';

enum NavbarItem { characters, locations, episodes, settings }

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}
