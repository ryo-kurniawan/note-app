import 'package:get/get.dart';
import 'package:note_app/data/note.remote.dart';
import 'package:note_app/data/repositories/note_repository.impl.dart';
import 'package:note_app/domain/note_repository.dart';
import 'package:note_app/ui/controllers/note_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<NoteRemoteDataSource>(NoteRemoteDataSourceImpl());
    Get.put<NoteRepository>(NoteRepositoryImpl(
        noteRemoteDataSource: Get.find<NoteRemoteDataSource>()));
  }
}
