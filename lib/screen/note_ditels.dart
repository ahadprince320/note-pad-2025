import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/note_controller.dart';

class note_screen extends StatefulWidget {
  const note_screen({super.key});

  @override
  State<note_screen> createState() => _note_screenState();
}

class _note_screenState extends State<note_screen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Note Details")),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date: ${args['date']}"),
                SizedBox(height: 20),
                Text(
                  args['title'],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  args['content'],
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
      );
    }

  }

