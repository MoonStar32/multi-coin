import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool is0n) {
    themeMode = is0n ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      shadowColor: const Color.fromARGB(20, 17, 197, 238),
      cardColor: const Color.fromARGB(255, 32, 34, 56),
      scaffoldBackgroundColor: const Color.fromARGB(255, 19, 20, 34),
      primarySwatch: Colors.cyan,
      dividerColor: Colors.white24,
      listTileTheme: const ListTileThemeData(iconColor: Colors.white),
      appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 32, 34, 56),
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
      textTheme: TextTheme(
        bodyMedium: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ));

  static final lightTheme = ThemeData();
}
