import 'package:get/get.dart';
import 'package:note_app/domain/note_repository.dart';
import 'package:note_app/ui/controllers/note_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => NoteController(repo: Get.find<NoteRepository>()));
  }
}
