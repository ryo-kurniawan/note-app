import 'package:equatable/equatable.dart';
import 'package:note_app/data/models/note.model.dart';

class Note extends Equatable {
  final int? id;
  final String title;
  final String content;

  const Note({
    this.id,
    required this.title,
    required this.content,
  });

  // Remove all new lines
  String get cleanContent => content.replaceAll('\n', '');

  // convert to model
  NoteModel toModel() => NoteModel(id: id, title: title, content: content);

  @override
  List<Object?> get props => [id, title, content];
}
