import 'package:equatable/equatable.dart';
import 'package:note_app/domain/entities/note.dart';

class NoteModel extends Equatable {
  final int? id;
  final String title;
  final String content;

  NoteModel({
    this.id,
    required this.title,
    required this.content,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
    };
  }

  /// Converts the model to an entity.
  ///
  /// This is typically used when displaying the object in a user interface or when
  /// performing calculations on the object.
  ///
  /// The resulting entity has the same properties as the model, but is not
  /// serializable to JSON.
  Note toEntity() => Note(id: id, title: title, content: content);

  @override
  List<Object?> get props => [id, title, content];
}
