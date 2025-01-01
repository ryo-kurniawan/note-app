import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/routes/app_pages.dart';
import 'package:note_app/routes/app_routes.dart';
import 'package:note_app/ui/bindings/initial_binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: AppPages.pages,
      initialBinding: InitialBinding(),
    );
  }
}
