import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rick_morty/screens/character/character_screen.dart';
import 'package:rick_morty/screens/episode/episode.dart';
import 'package:rick_morty/screens/location/location.dart';
import 'package:rick_morty/screens/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          CharacterScreen(),
          LocationScreen(),
          EpisodeScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bxs_ghost),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_planet),
            label: 'Локации',
          ),
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_tv),
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Настройки',
          ),
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}
