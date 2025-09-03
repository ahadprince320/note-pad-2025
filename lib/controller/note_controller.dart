import 'package:get/get.dart';
import 'package:note_book/model/note_model.dart';

class NoteController extends GetxController{
  var noteList=<NoteModel>[].obs;
      
  void addNote(NoteModel note){
    noteList.add(note);
  }
  void removeNote(int index){
    noteList.removeAt(index);
  }
  void updateNote(int index,NoteModel note){
    noteList[index]=note;
  }
}