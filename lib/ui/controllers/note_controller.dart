import 'package:get/get.dart';
import 'package:note_app/domain/entities/note.dart';
import 'package:note_app/domain/note_repository.dart';

class NoteController extends GetxController {
  final NoteRepository repo;
  final notes = <Note>[].obs;
  final isLoading = false.obs;

  NoteController({required this.repo});

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    isLoading.value = true;
    final result = await repo.fetchNotes();
    result.fold((l) => Get.snackbar('Error', l), (r) => notes.assignAll(r));
    isLoading.value = false;
  }

  Future<void> addNote(Note note) async {
    final result = await repo.addNote(note);
    result.fold(
      (failure) => Get.snackbar(
          'Error', failure.toString()), // Tangani error dengan pesan deskriptif
      (success) => notes.add(note), // Tambahkan catatan ke daftar jika berhasil
    );
  }

  Future<void> removeNote(int id) async {
    // Pastikan id sesuai dengan tipe data entitas Note
    final result = await repo.removeNoteById(id);
    result.fold(
      (failure) => Get.snackbar('Error', failure.toString()),
      (success) => notes
          .removeWhere((note) => note.id == id), // Hapus catatan yang sesuai
    );
  }

  Future<void> updateNote(int id, Note updatedNote) async {
    // Sesuaikan id dengan tipe String
    final result = await repo.updateNote(id, updatedNote);
    result.fold(
      (failure) => Get.snackbar('Error', failure.toString()),
      (success) {
        final index = notes.indexWhere((note) => note.id == id);
        if (index != -1) {
          notes[index] = updatedNote; // Perbarui catatan jika ditemukan
        }
      },
    );
  }
}
