import 'package:flutter/material.dart';
import 'package:minimal_notes_app/theme/theme.dart';

// A provider class to manage the app's theme
class ThemeProvider with ChangeNotifier {

  // Initially, theme is light mode
  ThemeData _themeData = lightMode;

  // Getter methods to access the theme from other parts of the code
  ThemeData get themeData => _themeData;

  // Getter methods o check if we in dark mode
  bool get isDarkMode => _themeData  == darkMode;

  // Setter Theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Methods to toggle between Light and Dark themes
  void toggleTheme() {
    if (_themeData == lightMode) {
      // If the current theme is light mode, switch to dark mode
      themeData = darkMode;
    }
    else {
      // If the current theme is dark mode, switch to light mode
      themeData = lightMode;
    }
  }
}