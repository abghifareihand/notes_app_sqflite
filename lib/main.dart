import 'package:flutter/material.dart';
import 'package:latihan_sqflite_dicoding/pages/note_list_page.dart';
import 'package:latihan_sqflite_dicoding/providers/db_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DbProvider(),
        ),
      ],
      child: const MaterialApp(
        home: NoteListPage(),
      ),
    );
  }
}
