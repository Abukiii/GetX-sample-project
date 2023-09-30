import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConstants {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
    color: Colors.black, // Add the app bar color here
  ),
  iconTheme: IconThemeData(color: Colors.grey),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.0,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 12.0,
        color: Colors.black,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
    color: Colors.white, // Add the app bar color here
  ),
  iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.0,
        color: Colors.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
