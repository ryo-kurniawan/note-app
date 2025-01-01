import 'package:get/get.dart';
import 'package:note_app/ui/bindings/home_binding.dart';
import 'package:note_app/ui/pages/home_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
      binding: HomeBinding(),
    )
  ];
}
