import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  Future<void> toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt('themeMode', themeMode.index);
  }

  Future<void> loadTheme() async {
    final preferences = await SharedPreferences.getInstance();
    final savedThemeIndex = preferences.getInt('themeMode');
    if (savedThemeIndex != null) {
      themeMode = ThemeMode.values[savedThemeIndex];
      notifyListeners();
    }
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    shadowColor: const Color.fromARGB(20, 17, 197, 238),
    cardColor: const Color.fromARGB(255, 32, 34, 56),
    scaffoldBackgroundColor: const Color.fromARGB(255, 19, 20, 34),
    primarySwatch: Colors.cyan,
    dividerColor: Colors.white24,
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 32, 34, 56),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    shadowColor: const Color.fromARGB(173, 17, 197, 238),
    cardColor: Colors.cyan,
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.cyan,
    dividerColor: Colors.white24,
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.cyan,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
  );
}
