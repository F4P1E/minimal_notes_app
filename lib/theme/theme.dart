import 'package:flutter/material.dart';

// Define the theme data for Light Mode
ThemeData lightMode = ThemeData(
  // Set the brightness to Light
  brightness: Brightness.light,
  // Define the color scheme for light mode
  colorScheme: ColorScheme.light(
    // Set the background color
    background: Colors.grey.shade100,
    // Set the primary color
    primary: Colors.grey.shade200,
    // Set the secondary color
    secondary: Colors.grey.shade400,
    // Set the inverse primary color
    inversePrimary: Colors.grey.shade800,
  ),
  // Define the list tile theme for Light Mode
  listTileTheme: const ListTileThemeData(
    // Set the icon color
      iconColor: Colors.grey,
    ),
);

// Define the theme data for Dark Mode
ThemeData darkMode = ThemeData(
  // Set the brightness to Dark
  brightness: Brightness.dark,
  // Define the color scheme for dark mode
  colorScheme: ColorScheme.dark(
    // Set the background color
    background: const Color.fromARGB(255, 24, 24, 24),
    // Set the primary color
    primary: Colors.grey.shade800,
    // Set the secondary color
    secondary: Colors.grey.shade700,
    // Set the inverse primary color
    inversePrimary: Colors.grey.shade300,
  ),
);