import 'package:flutter/material.dart';

class WebsiteTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'OldStandardTT', // or any preferred font
    ),
    titleLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.black.withOpacity(0.8),
      fontWeight: FontWeight.bold,
      fontFamily: 'OldStandardTT', // or any preferred font
    ),
    bodyLarge: TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontSize: 14.0,
      fontFamily: 'Roboto', // or any preferred serif font
    ),
    bodySmall: TextStyle(
      color: Colors.red,

      fontFamily: 'Roboto', // or any preferred font
    ),
  );

  static ThemeData websiteTheme = ThemeData(
    useMaterial3: true,
    textTheme: lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    ),
  );
}
