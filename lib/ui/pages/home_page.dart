import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/ui/controllers/note_controller.dart';
import 'package:note_app/ui/widgets/note_form.dart';
import 'package:note_app/ui/widgets/note_list.dart';

class HomePage extends GetView<NoteController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
      ),
      body: Obx(() => ListView.builder(
            itemBuilder: (_, index) => NoteList(note: controller.notes[index]),
            itemCount: controller.notes.length,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) => NoteForm());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
