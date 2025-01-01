import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/data/models/note.model.dart';
import 'package:note_app/domain/entities/note.dart';

void main() {
  group('NoteModel', () {
    late NoteModel note;

    setUp(() {
      note = NoteModel(
        id: 1,
        title: 'Test note',
        content: 'Note content',
      );
    });

    test('Should convert to Entity', () {
      // Arrange
      final expectedNote = Note(
        id: 1,
        title: 'Test note',
        content: 'Note content',
      );

      // Act
      final result = note.toEntity();

      // Assert
      expect(result, expectedNote);
    });

    test('Should convert to JSON', () {
      // Arrange
      final expectedJson = {
        'id': 1,
        'title': 'Test note',
        'content': 'Note content'
      };

      // Act
      final result = note.toJson();

      // Assert
      expect(result, expectedJson);
    });

    test('Should convert from JSON', () {
      // Arrange
      final json = {'id': 1, 'title': 'Test note', 'content': 'Note content'};

      // Act
      final result = NoteModel.fromJson(json);

      // Assert
      expect(result, note);
    });
  });

  group('Note', () {
    test('Should convert to Model', () {
      // Arrange
      final expectedNote = NoteModel(
        id: 1,
        title: 'Test note',
        content: 'Note content',
      );

      // Act
      final result = Note(
        id: 1,
        title: 'Test note',
        content: 'Note content',
      ).toModel();

      // Assert
      expect(result, expectedNote);
    });
    test('should be equal when properties are the same', () {
      const note1 = Note(
        id: 1,
        title: 'Test Title',
        content: 'Test Content',
      );

      const note2 = Note(
        id: 1,
        title: 'Test Title',
        content: 'Test Content',
      );

      expect(note1, note2); // Using Equatable's equality
    });

    test('should not be equal when properties are different', () {
      const note1 = Note(
        id: 1,
        title: 'Test Title',
        content: 'Test Content',
      );

      const note2 = Note(
        id: 2,
        title: 'Another Title',
        content: 'Another Content',
      );

      expect(note1, isNot(note2));
    });

    test('cleanContent should remove new lines', () {
      const note = Note(
        id: 1,
        title: 'Test Title',
        content: 'Line 1\nLine 2\nLine 3',
      );

      expect(note.cleanContent, 'Line 1Line 2Line 3');
    });
  });
}
