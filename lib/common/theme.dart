import 'package:flutter/material.dart';

class AppTheme {
  //
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff0B1E2D),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff152A3A),
      selectedItemColor: Color(0xff43D049),
      unselectedItemColor: Color(0xff5B6975),
    ),
    fontFamily: 'Roboto',
    textTheme: textTheme(),
  );
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF2F2F2),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xffE5E5E5),
      selectedItemColor: Color(0xff22A2BD),
      unselectedItemColor: Color(0xffBDBDBD),
    ),
    fontFamily: 'Roboto',
    textTheme: textTheme(),
  );
}

ThemeData searchTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xff0B1E2D),
    appBarTheme: const AppBarTheme(
      color: Color(0xff0B1E2D),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    dividerTheme: const DividerThemeData(
      color: Colors.transparent,
    ),
    brightness: Brightness.dark,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
    ),
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      color: Color(0xff5B6975),
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Color(0xff5B6975),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Color(0xff5B6975),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}
