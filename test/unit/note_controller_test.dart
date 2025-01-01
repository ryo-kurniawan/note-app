import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/domain/entities/note.dart';
import 'package:note_app/domain/note_repository.dart';
import 'package:note_app/ui/controllers/note_controller.dart';

import 'note_controller_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  group('NoteController', () {
    late NoteController noteController;
    late NoteRepository mockedRepo = MockNoteRepository();

    setUp(() {
      mockedRepo = MockNoteRepository();
      noteController = NoteController(repo: mockedRepo);
    });

    test('Should fetch notes', () async {
      // Arrange
      when(mockedRepo.fetchNotes()).thenAnswer(
        (_) => Future.value(const Right(<Note>[
          Note(
            id: 1,
            title: 'Testing note',
            content: 'Note content',
          )
        ])),
      );

      // Act
      await noteController.fetchNotes();

      // Assert
      expect(noteController.notes.isNotEmpty, true);
      expect(noteController.notes[0].title, 'Testing note');
      // expect(find.text('Testing note'), findsOneWidget);
    });

    test('Should add a note', () async {
      // Arrange
      const note = Note(
        id: 1,
        title: 'Test note',
        content: 'Note content',
      );
      when(mockedRepo.addNote(note)).thenAnswer(
        (_) => Future.value(const Right(unit)), // Simulasikan operasi berhasil
      );

      // Act
      await noteController.addNote(note);

      // Assert
      expect(noteController.notes.length, 1);
      expect(noteController.notes[0].id, 1);
      verify(mockedRepo.addNote(note))
          .called(1); // Verifikasi pemanggilan repository
    });

    test('Should remove a note by id', () async {
      // Arrange
      const note = Note(
        id: 1,
        title: 'Testing note',
        content: 'Note content',
      );
      noteController.notes.add(note);
      when(mockedRepo.removeNoteById(1)).thenAnswer(
        (_) => Future.value(const Right(unit)),
      );

      // Act
      await noteController.removeNote(1);

      // Assert
      expect(noteController.notes.isEmpty, true);
      verify(mockedRepo.removeNoteById(1)).called(1);
    });

    test('Should update a note', () async {
      // Arrange
      const initialNote = Note(
        id: 1,
        title: 'Testing note',
        content: 'Note content',
      );
      const updatedNote = Note(
        id: 1,
        title: 'Updated note',
        content: 'Updated note content',
      );
      noteController.notes.add(initialNote);
      when(mockedRepo.updateNote(1, updatedNote)).thenAnswer(
        (_) => Future.value(const Right(unit)),
      );

      // Act
      await noteController.updateNote(1, updatedNote);

      // Assert
      expect(noteController.notes[0].title, 'Updated note');
      expect(noteController.notes[0].content, 'Updated note content');
      verify(mockedRepo.updateNote(1, updatedNote)).called(1);
    });

    test('Should fetch notes in onInit', () async {
      // Arrange
      when(mockedRepo.fetchNotes()).thenAnswer(
        (_) => Future.value(const Right(<Note>[])),
      );

      // Act
      noteController.onInit();

      // Assert
      expect(noteController.notes.isEmpty, true);
      verify(mockedRepo.fetchNotes()).called(1);
      expect(noteController.isLoading.value, true);
    });
  });
}
