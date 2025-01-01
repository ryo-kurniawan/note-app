import 'package:note_app/domain/entities/note.dart';
import 'package:dartz/dartz.dart';

abstract class NoteRepository {
  Future<Either<String, List<Note>>> fetchNotes();
  Future<Either<String, Unit>> addNote(Note note);
  Future<Either<String, Unit>> removeNoteById(int id);
  Future<Either<String, Unit>> updateNote(int id, Note updatedNote);
}
