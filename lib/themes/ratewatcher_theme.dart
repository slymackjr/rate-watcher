/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RateWatcherTheme{
  // 1
  static TextTheme lightTextTheme = TextTheme(
    // bodyText1
      bodyLarge:  GoogleFonts.openSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    // headline1
    displayLarge: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),// headline2
    displayMedium: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),// headline3
    displaySmall: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),// headline6
    titleLarge: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
      );
  // 2
static TextTheme darkTextTheme = TextTheme(
  // bodyText1
  bodyLarge:  GoogleFonts.openSans(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  // headline1
  displayLarge: GoogleFonts.openSans(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),// headline2
  displayMedium: GoogleFonts.openSans(
    fontSize: 21.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),// headline3
  displaySmall: GoogleFonts.openSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),// headline6
  titleLarge: GoogleFonts.openSans(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
      );

  static ThemeData light(){
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        })
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }
  // 4
static ThemeData dark(){
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
}
}*/
/*
import 'package:flutter/material.dart';

class RateWatcherTheme {
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Colors.purple,
        secondary: Colors.deepPurple,
      ),
      textTheme: const TextTheme(
        headline4: TextStyle(color: Colors.white, fontSize: 24),
        headline6: TextStyle(color: Colors.white, fontSize: 20),
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
    );
  }
}

*/
import 'package:flutter/material.dart';

class RateWatcherTheme {
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Colors.purple,
        secondary: Colors.deepPurple,
      ),
      textTheme: const TextTheme(
        headline4: TextStyle(color: Colors.white, fontSize: 24),
        headline6: TextStyle(color: Colors.white, fontSize: 20),
        bodyText1: TextStyle(color: Colors.white60),
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

