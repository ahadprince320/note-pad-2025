import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_book/screen/bottom%20bar.dart';
import 'package:note_book/screen/note_ditels.dart';

import 'model/note_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Adapter
  Hive.registerAdapter(NoteModelAdapter());

  // Open Box
  await Hive.openBox<NoteModel>('notesBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/note_screen': (context)=>note_screen(),
      },
      home: BottomNavigation(
        
      ),
    );
  }
}
