import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_notes_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

// A setting page to allow the user to toggle between Light and Dark themes
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text to Display "Dark Mode"
            Text(
              'Dark Mode',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary
              )
            ),
            // Switch widget to toggle between light and dark themes
            CupertinoSwitch(
              // Set the switch value based on whether the current theme is Dark Mode
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,

              // Callback to toggle the theme when the switch is changed
              onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme()
            )
          ],
        ),
      ),
    );
  }
}