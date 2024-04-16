// Author: Duong Phu Dong
// Personal Project: Minimal Notes Application
// Language: Flutter
// Major: Software Engineering
// University: Royal Melbourne Institute of Technology (Vietnam, SGS Campus)


import 'package:flutter/material.dart';
import 'package:minimal_notes_app/models/note.dart';
import 'package:minimal_notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Text Controller to access what User Type In
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

  // On app startup, fetch existing notes
    readNotes();
  }
  // Create a Note
  void createNote() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          // Create Button
          MaterialButton(
            onPressed: () {
            // Add to Database
            context.read<NoteDatabase>().addNote(textController.text);

            // Clear controller
            textController.clear();

            // Pop dialog box
            Navigator.pop(context);
            },
            child: const Text("Create Note"),
          )
        ],
      ),
    );
  }

  // Read Notes
  void readNotes(){
    context.watch<NoteDatabase>().fetchNotes();
  }
  // Update a Note
  void updateNote(Note note) {
    // Pre-fill the current note text
    textController.text = note.text;
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Update Note"),
        content: TextField(controller: textController),
        actions: [
          // Update Button
          MaterialButton(onPressed:   () {
            // Update note in database
            context.read<NoteDatabase>().updateNote(note.id, textController.text);
              // Clear Controlller
              textController.clear();
              // Pop Dialog box
              Navigator.pop(context);
          },
          child: const Text("Update"),
          )
        ],
      ),
    );
  }

  // Delete a Note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    //Note Database
    final noteDatabase = context.watch<NoteDatabase>();

    // Current Notes
    List<Note> currentNotes =  noteDatabase.currentNotes;
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          // Get Individual Note
          final note = currentNotes[index];

          // List title UI
          return ListTile(
            title: Text(note.text),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Edit Button
                IconButton (
                  onPressed: () => updateNote(note),
                  icon: const Icon (Icons.edit),
                ), // IconButton

                // Delete Button
                   IconButton (
                  onPressed: () => deleteNote(note.id),
                  icon: const Icon (Icons.delete),
                ), // IconButton
              ]
            )
          );
        },
      ),
    );
  }
}