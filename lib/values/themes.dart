import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[50],
    selectedItemColor: Colors.blueAccent,
    unselectedItemColor: Colors.black,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.blueAccent,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[750],
    selectedItemColor: Colors.blueAccent,
    unselectedItemColor: Colors.white,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.blueAccent,
  ),
);
