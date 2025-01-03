import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app/domain/entities/note.dart';
import 'package:note_app/ui/controllers/note_controller.dart';

class NoteForm extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final NoteController noteController = Get.find<NoteController>();
  final Note? note;
  final void Function(Note) onSave;

  NoteForm({super.key, this.note, required this.onSave});

  @override
  Widget build(BuildContext context) {
    // Menggunakan controller yang sudah ada jika ada catatan
    titleController.text = note?.title ?? '';
    contentController.text = note?.content ?? '';

    return AlertDialog(
      title: Text(note == null ? 'Add Note' : 'Edit Note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: contentController,
            decoration: const InputDecoration(labelText: 'Content'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final newNote = Note(
              id: note?.id, // ID tetap ada jika mengedit
              title: titleController.text,
              content: contentController.text,
            );
            onSave(newNote); // Simpan catatan baru atau yang diubah
            Navigator.pop(context); // Tutup dialog
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
