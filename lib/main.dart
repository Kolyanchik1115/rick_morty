import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/character_bloc/character/character_bloc.dart';
import 'package:rick_morty/blocs/character_bloc/search_character/search_character_bloc.dart';
import 'package:rick_morty/blocs/navigation/navigation_bloc.dart';
import 'package:rick_morty/config/theme.dart';
import 'package:rick_morty/data/repositories/character_repo.dart';
import 'package:rick_morty/screens/home/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      theme: darkTheme(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharacterBloc(
              characterRepo: CharacterRepo(),
            )..add(CharacterEventFetch()),
          ),
          BlocProvider(create: (context) => NavigationBloc()),
          BlocProvider(
            create: (context) => SearchCharacterBloc(
              searchPerson: CharacterRepo(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Rick and Morty',
          debugShowCheckedModeBanner: false,
          theme: darkTheme(),
          home: const RootScreen(),
        ),
      ),
    );
  }
}
