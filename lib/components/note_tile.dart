// This widget, NoteTile, represents a single note item in the list. It takes in three parametres:
// 1. text: The note content to display.
// 2. onDeletePressed: A callback function that is triggered when the delete option is selected.
// 3. onEditPressed: A callback function that is triggered when the edit option is selected.

// Import Package
import 'package:flutter/material.dart';
import 'package:minimal_notes_app/components/note_settings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onDeletePressed;
  final void Function()? onEditPressed;

  const NoteTile({
    super.key,
    required this.text,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8), // Sets the border radius for rounded corners.
      ),
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: ListTile(
        title: Text(text), // Displays the note text.
        trailing: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.more_vert), // More options icon.
            onPressed: () => {
              // Show a popover with note settings (edit/delete) when the more options icon is pressed.
              showPopover(
                width: 100,
                height: 100,
                backgroundColor: Theme.of(context).colorScheme.background,
                context: context,
                bodyBuilder: (context) => NoteSettings(
                  onEditTab: onEditPressed, // Callback for the edit option.
                  onDeleteTab: onDeletePressed, // Callback for the delete option.
                ),
              )
            },
          ),
        )
      ),
    );
  }
}
