// Author: Duong Phu Dong
// Personal Project: Minimal Notes Application
// Language: Flutter
// Major: Software Engineering
// University: Royal Melbourne Institute of Technology (Vietnam, SGS Campus)

// Import packages
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:minimal_notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

// A provider class to manage CRUD operations for notes using Isar Database
class NoteDatabase extends ChangeNotifier{
  // Static Isar instance for database operations
  static late Isar isar;

  // Initialize - Database
  static Future<void> initialize() async {
    // Get the application documents directory
    final dir = await getApplicationDocumentsDirectory();
    // Open Isar database with  NoteSchema
    isar = await Isar.open(
       [NoteSchema],
       directory: dir.path,
      );
  }

  // List to store the current notes
  final List<Note> currentNotes = [];

  // Method to create a new note and save it to the database
  Future<void> addNote(String textFromUser) async {
    // Create a new note object with the provided text
    final newNote = Note()..text = textFromUser;
    // Save the new note to the database
    await isar.writeTxn(() => isar.notes.put(newNote));

    // Refresh the list of notes from the database
    fetchNotes();
  }

  // Method to read all notes from the database
  Future<void> fetchNotes() async {
    // Fetch all notes from the database
    List<Note> fetchNotes = await isar.notes.where().findAll();
    // Clear the current list of notes
    currentNotes.clear();
    // Add the fetched notes to the curent list 
    currentNotes.addAll(fetchNotes);
    // Notify listeners that the data has changed
    notifyListeners();
  }

  // Method to update a note in the database
  Future<void> updateNote(int id, String newText) async {
    // Get the existing note from the database using its
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      // Update the text of the existing note
      existingNote.text = newText;
      // Save the updated note to the database
      await isar.writeTxn(() => isar.notes.put(existingNote));
      // Refresh the list of notes from the database
      await fetchNotes();
    }
  }

  // Method to delete a note from the database
  Future<void> deleteNote(int id) async {
    // Delete the note from the database using its ID
    await isar.writeTxn(() => isar.notes.delete(id));
    // Refresh the list of notes from the database
    await fetchNotes();
  }
}