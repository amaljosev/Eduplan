import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        primary: const Color(0xFF6A5AE0),
        secondary: const Color.fromARGB(43, 106, 90, 224),
        tertiary: Colors.indigo.shade100),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
      bodyMedium: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
      bodySmall: TextStyle(fontSize: 10, fontFamily: 'Poppins'),
      titleLarge: TextStyle(
          fontSize: 30, color: Color(0xFF6A5AE0), fontFamily: 'Pacifico'),
      headlineLarge: TextStyle(
          fontSize: 30, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
          fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: Colors.white);
ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF9C88FF), // Lighter purple for dark mode
    secondary: Color(0x334A3AFF), // Semi-transparent purple accent
    tertiary: Color(0xFF2C2C2C), // Dark gray for tertiary elements
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
);
