import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/note_model.dart';

class NoteController extends GetxController {
  var noteList = <NoteModel>[].obs;
  late Box<NoteModel> noteBox;

  @override
  void onInit() {
    super.onInit();
    noteBox = Hive.box<NoteModel>('notesBox');
    loadNotes();
  }

  void loadNotes() {
    noteList.assignAll(noteBox.values.toList());
  }

  void addNote(NoteModel note) {
    noteBox.add(note);
    loadNotes();
  }

  void removeNote(int index) {
    noteBox.deleteAt(index);
    loadNotes();
  }

  void updateNote(int index, NoteModel updatedNote) {
    noteBox.putAt(index, updatedNote);
    loadNotes();
  }
}
