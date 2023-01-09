import 'package:flutter/material.dart';
import 'package:rick_morty/widgets/search_bar.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  static const String routeName = '/character';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CharacterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        hintText: 'Найти персонажа',
      ),
    );
  }
}
