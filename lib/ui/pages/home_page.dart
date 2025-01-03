import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/domain/entities/note.dart';
import 'package:note_app/ui/controllers/note_controller.dart';
import 'package:note_app/ui/widgets/note_form.dart';
import 'package:note_app/ui/widgets/note_list.dart';

class HomePage extends GetView<NoteController> {
  const HomePage({super.key});

  void showNoteForm(BuildContext context, {Note? note}) {
    showDialog(
      context: context,
      builder: (_) => NoteForm(
        note: note,
        onSave: (newNote) {
          if (note == null) {
            controller.addNote(newNote); // Tambah catatan baru
          } else {
            controller.updateNote(newNote.id!, newNote); // Update catatan
          }
        },
      ),
    );
  }

  void confirmDelete(BuildContext context, int id) {
    Get.defaultDialog(
      title: 'Delete Note',
      middleText: 'Are you sure you want to delete this note?',
      onConfirm: () {
        controller.removeNote(id);
        Get.back(); // Tutup dialog
      },
      onCancel: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
      ),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return const Center(
            child: Text('No notes available.'),
          );
        }
        return ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (_, index) {
            final note = controller.notes[index];
            return NoteList(
              note: note,
              onEdit: () => showNoteForm(context, note: note), // Edit catatan
              onDelete: () => confirmDelete(context, note.id!), // Hapus catatan
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showNoteForm(context), // Tambah catatan baru
        child: const Icon(Icons.add),
      ),
    );
  }
}
