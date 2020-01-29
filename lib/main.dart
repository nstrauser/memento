import 'package:flutter/material.dart';
import 'screens/note_list.dart';
import 'screens/note_detail.dart';
import 'shared/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'NoteKeeper',
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      home: NoteList(),
    );
  }
}