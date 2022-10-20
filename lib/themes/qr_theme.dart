import 'package:flutter/material.dart';

class QrTheme {
  
  static const primaryColor = Colors.indigo;
  static const secondaryColor = Colors.white54;
  static const thirdColor = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        color: primaryColor,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        unselectedIconTheme: IconThemeData(
          color: secondaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          color: secondaryColor,
        ),
        selectedIconTheme: IconThemeData(
          color: thirdColor,
        ),
        selectedLabelStyle: TextStyle(
          color: thirdColor,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        elevation: 9,
      )
      
  );
}
