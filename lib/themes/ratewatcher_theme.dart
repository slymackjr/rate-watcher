import 'package:flutter/material.dart';

class RateWatcherTheme {
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Colors.purple,
        secondary: Colors.deepPurple,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white, fontSize: 24),  // Used instead of headline4
        headlineSmall: TextStyle(color: Colors.white, fontSize: 20),  // Used instead of headline5
        titleLarge: TextStyle(color: Colors.white, fontSize: 20),    // Used instead of headline6
        bodyLarge: TextStyle(color: Colors.white60),                 // Used instead of bodyText1
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          textStyle: const TextStyle(color: Colors.white),
        ),
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}

