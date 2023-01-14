import 'package:flutter/material.dart';
import 'package:rick_morty/screens/character/character_screen.dart';
import 'package:rick_morty/screens/episode/episode.dart';
import 'package:rick_morty/screens/home/home_screen.dart';
import 'package:rick_morty/screens/location/location.dart';
import 'package:rick_morty/screens/settings/settings_screen.dart';

class AppRouter {
  static Route onGenerationRoute(RouteSettings settings) {
    debugPrint('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/character':
        return CharacterScreen.route();
      case '/location':
        return LocationScreen.route();
      case '/settings':
        return SettingsScreen.route();
      case '/episode':
        return EpisodeScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
