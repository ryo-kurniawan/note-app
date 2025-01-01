import 'package:flutter_test/flutter_test.dart';
import 'unit/note_controller_test.dart' as note_controller_test;
import 'unit/note_model_test.dart' as note_model_test;

/// Runs all the unit tests in this package.
void main() {
  group('Unit test', () {
    /// Runs all the unit tests for the NoteController class.
    note_controller_test.main();

    /// Runs all the unit tests for the NoteModel class.
    note_model_test.main();
  });

  /// Runs all the widget tests for this package. This is a no-op because
  /// widget tests are not implemented.
  group('Widget test', () {});
}
