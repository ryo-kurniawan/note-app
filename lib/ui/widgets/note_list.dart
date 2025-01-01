import 'package:flutter/material.dart';
import 'package:note_app/domain/entities/note.dart';

class NoteList extends StatelessWidget {
  final Note note;
  const NoteList({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(
        note.content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
