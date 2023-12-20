import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF111427),
    colorScheme: const ColorScheme.dark(),
    primaryColor: const Color(0xFF111427),
    fontFamily: "SF Pro Text",
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFE7EEFB),
    colorScheme: const ColorScheme.light(),
    primaryColor: const Color(0xFFE7EEFB),
    fontFamily: "SF Pro Text",
  );
}
