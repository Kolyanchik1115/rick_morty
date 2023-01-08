import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xff0B1E2D),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff152A3A),
      selectedItemColor: Color(0xff43D049),
      unselectedItemColor: Color(0xff5B6975),
    ),
    fontFamily: 'Roboto',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Colors.blueAccent,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: Colors.blueAccent,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
}
