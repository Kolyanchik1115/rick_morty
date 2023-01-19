import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rick_morty/feature/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:rick_morty/feature/presentation/screens/character/character_screen.dart';
import 'package:rick_morty/feature/presentation/screens/episode/episode.dart';
import 'package:rick_morty/feature/presentation/screens/location/location.dart';
import 'package:rick_morty/feature/presentation/screens/settings/settings_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  BoxIcons.bxs_ghost,
                ),
                label: 'Перонажи',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  BoxIcons.bx_planet,
                ),
                label: 'Локации',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  BoxIcons.bx_tv,
                ),
                label: 'Эпизоды',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: 'Настройки',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                context
                    .read<NavigationBloc>()
                    .add(const NavigationTap(NavbarItem.characters));
              } else if (index == 1) {
                context
                    .read<NavigationBloc>()
                    .add(const NavigationTap(NavbarItem.locations));
              } else if (index == 2) {
                context
                    .read<NavigationBloc>()
                    .add(const NavigationTap(NavbarItem.episodes));
              } else if (index == 3) {
                context
                    .read<NavigationBloc>()
                    .add(const NavigationTap(NavbarItem.settings));
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.characters) {
            return CharacterScreen();
          }
          if (state.navbarItem == NavbarItem.locations) {
            return const LocationScreen();
          }
          if (state.navbarItem == NavbarItem.episodes) {
            return const EpisodeScreen();
          }
          if (state.navbarItem == NavbarItem.settings) {
            return const SettingsScreen();
          }
          return Container();
        },
      ),
    );
  }
}
