import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/common/theme.dart';
import 'package:rick_morty/feature/presentation/blocs/character/character_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/episode/episode_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/location/location_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:rick_morty/feature/presentation/blocs/search/search_bloc.dart';
import 'package:rick_morty/locator_service.dart' as di;
import 'package:rick_morty/feature/presentation/screens/home/home_screen.dart';

import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CharacterBloc>()..add(CharacterEventFetch()),
        ),
        BlocProvider(
          create: (context) => sl<LocationBloc>()..add(LocationEventFetch()),
        ),
        BlocProvider(
          create: (context) => sl<EpisodeBloc>()..add(EpisodeEventFetch()),
        ),
        BlocProvider(create: (context) => sl<NavigationBloc>()),
      ],
      child: MaterialApp(
        title: 'Rick and Morty',
        debugShowCheckedModeBanner: false,
        theme: darkTheme(),
        home: const RootScreen(),
      ),
    );
  }
}
