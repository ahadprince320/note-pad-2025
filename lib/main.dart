import 'package:flutter/material.dart';
import 'package:note_book/screen/bottom%20bar.dart';
import 'package:note_book/screen/note_ditels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/note_screen': (context)=>note_screen(),
      },
      home: bottomNavigation(
        
      ),
    );
  }
}
