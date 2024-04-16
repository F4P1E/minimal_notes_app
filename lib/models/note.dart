// Author: Duong Phu Dong
// Personal Project: Minimal Notes Application
// Language: Flutter
// Major: Software Engineering
// University: Royal Melbourne Institute of Technology (Vietnam, SGS Campus)


import 'package:isar/isar.dart';

// This line is needed to generate file
// Then run: dart run build_runner build
part 'note.g.dart';

// Annotation to mark the class as an Isar Collection
@Collection()
class Note {
  // Automatically generated ID with auto-increment
  Id id = Isar.autoIncrement;
  // The text content of the note
  late String text;
}