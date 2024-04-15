import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:minimal_notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{
  static late Isar isar;

  // Initialize - Database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
       [NoteSchema],
       directory: dir.path,
      );
  }

  // List of Notes
  final List<Note> currentNotes = [];

  // Create - a note and save to database
  Future<void> addNote(String textFromUser) async {
    // Create a new note object
    final newNote = Note()..text = textFromUser;
    // Save to Database
    await isar.writeTxn(() => isar.notes.put(newNote));

    // Re-Read from Database
    fetchNotes();
  }

  // Read - notes from database
  Future<void> fetchNotes() async {
    List<Note> fetchNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchNotes);
    notifyListeners();
  }

  // Update - a notes in database
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // Delete - a note from the database
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}