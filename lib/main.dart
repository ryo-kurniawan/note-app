import 'package:flutter/material.dart';
import 'package:note_app/common/variables.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Variables.supabaseUrl,
    anonKey: Variables.supabaseAnonKey,
  );

  runApp(const MyApp());
}
