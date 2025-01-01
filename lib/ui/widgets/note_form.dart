import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app/domain/entities/note.dart';
import 'package:note_app/ui/controllers/note_controller.dart';

class NoteForm extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final NoteController noteController = Get.find<NoteController>();
  NoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Note'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: contentController,
          decoration: const InputDecoration(labelText: 'Content'),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.trim().isEmpty ||
                    contentController.text.trim().isEmpty) {
                  Get.snackbar(
                    'Error',
                    'Title and content cannot be empty',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  // Tambahkan catatan melalui NoteController
                  noteController.addNote(Note(
                    title: titleController.text.trim(),
                    content: contentController.text.trim(),
                  ));
                  Navigator.pop(context); // Tutup dialog
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ]),
    );
  }
}
