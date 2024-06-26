// Import packages for application
import 'package:flutter/material.dart';
import 'package:minimal_notes_app/models/note_database.dart';
import 'pages/notes_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  // Initialize note isar Database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
    providers: [
      // Note Provider
      ChangeNotifierProvider(create: (context) => NoteDatabase()),

      // Theme Provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}
