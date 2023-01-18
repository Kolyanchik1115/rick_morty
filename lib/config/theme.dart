import 'package:flutter/material.dart';

ThemeData darkTheme() {
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

// ThemeData lightTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Colors.blueAccent,
//       selectedItemColor: Colors.blueAccent,
//       unselectedItemColor: Color(0xff5B6975),
//     ),
//     fontFamily: 'Roboto',
//     textTheme: textTheme(),
//   );
// }

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
      color: Color(0xff5B6975),
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}
