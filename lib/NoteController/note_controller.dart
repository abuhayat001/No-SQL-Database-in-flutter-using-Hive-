import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../Note_mod/note_mod.dart';

class NoteControler extends GetxController{
  final Box box = Hive.box("notes");


  void creatNot (NoteMo note){
    box.add(note);

  }
  void update_note(NoteMo note, int index){
    box.putAt(index, note);
  }

  void delet_note (int index){
    box.deleteAt(index);
  }


}


