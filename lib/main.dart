import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/character/character_bloc.dart';
import 'package:rick_morty/config/app_router.dart';
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
      theme: theme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => CharacterRepo(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CharacterBloc(
                characterRepo: context.read<CharacterRepo>(),
              )..add(
                  const CharacterEventFetch(page: 1),
                ),
            ),
          ],
          child: MaterialApp(
            title: 'Rick and Morty',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerationRoute,
            initialRoute: HomeScreen.routeName,
          ),
        ),
      ),
    );
  }
}

// class Dashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextButton(
//           child: Text("Set locale to German"),
//           onPressed: () => MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: 'de')),
//         ),
//         TextButton(
//           child: Text("Set locale to English"),
//           onPressed: () => MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: 'en')),
//         ),
//       ],
//     );
//   }
// }