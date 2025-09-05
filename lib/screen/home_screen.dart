import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_book/controller/note_controller.dart';

import '../model/note_model.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Note Book',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Obx(() {
        return ListView.builder(

          itemCount: noteController.noteList.length,
          itemBuilder: (context, index) {
            final note = noteController.noteList[index];
            return Card(
              elevation: 4.0,
              child: ListTile(
                
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/note_screen',
                    arguments: {
                      'title': note.title,
                      'content': note.content,
                      'date': note.date,
                    }
                  );
                },
                title: Text(note.title + index.toString()),
                subtitle: Text(note.content + index.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {
                      _alertDialogedit(index,note);
                    }, icon: Icon(Icons.edit),),
              
                    IconButton(onPressed: () {
                      noteController.removeNote(index);
                    }, icon: Icon(Icons.delete)),
                  ],
                ),
              ),
            );
          },
        );
      },)
    );
  }
  _alertDialogedit(int index, NoteModel note) {
    showDialog(
      context: context,
      builder: (context) {
        final NoteController noteController = Get.put(NoteController());
        final TextEditingController titleController = TextEditingController();
        final TextEditingController contentController = TextEditingController();

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          elevation: 10,
          contentPadding: const EdgeInsets.all(0),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 60,
                  color: Colors.white,
                ),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.blueAccent),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), // border radius
                      borderSide: BorderSide.none, // border line hide করবে
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1,
                      ), // চাইলে রঙ দিতে পারো
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ), // focus হলে আলাদা style
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: 'Subtitele',
                    hintStyle: TextStyle(color: Colors.blueAccent),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), // border radius
                      borderSide: BorderSide.none, // border line hide করবে
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1,
                      ), // চাইলে রঙ দিতে পারো
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ), // focus হলে আলাদা style
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        final String formattedDate = DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now());
                        noteController.updateNote(
                          index,
                          NoteModel(
                            title: titleController.text,
                            content: contentController.text,
                            date: formattedDate,
                          ),
                        );
                        Get.back();
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
}
