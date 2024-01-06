import 'package:flutter/material.dart';

import 'Note_screen/note_screen.dart';
import 'package:lesson_15/Note_mod/note_mod.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteMoAdapter());
  await Hive.openBox("notes");// Make sure to use the correct adapter class name
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteScreen()  ,
    );
  }
}
