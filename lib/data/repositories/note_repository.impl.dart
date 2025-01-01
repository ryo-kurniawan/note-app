import 'package:dartz/dartz.dart';
import 'package:note_app/data/models/note.model.dart';
import 'package:note_app/data/note.remote.dart';
import 'package:note_app/domain/entities/note.dart';
import 'package:note_app/domain/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDataSource _noteRemoteDataSource;

  NoteRepositoryImpl({required NoteRemoteDataSource noteRemoteDataSource})
      : _noteRemoteDataSource = noteRemoteDataSource;

  @override
  Future<Either<String, List<Note>>> fetchNotes() async {
    try {
      final notes = await _noteRemoteDataSource.getAllNotes();
      return Right(notes.map((notes) => notes.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> addNote(Note note) async {
    try {
      await _noteRemoteDataSource.addNote(note.toModel());
      return Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> removeNoteById(int id) async {
    try {
      await _noteRemoteDataSource.removeNote(id);
      return Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> updateNote(int id, Note updatedNote) async {
    try {
      await _noteRemoteDataSource.updateNote(updatedNote.toModel());
      return Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
