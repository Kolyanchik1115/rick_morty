import 'package:flutter/material.dart';
import 'package:rick_morty/config/app_router.dart';
import 'package:rick_morty/config/theme.dart';
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
      onGenerateRoute: AppRouter.onGenerationRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
