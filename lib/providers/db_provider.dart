import 'package:flutter/material.dart';
import 'package:latihan_sqflite_dicoding/db/database_helper.dart';
import 'package:latihan_sqflite_dicoding/models/note.dart';

class DbProvider extends ChangeNotifier {
  
  late DatabaseHelper _dbHelper;
  List<Note> _notes = [];
  List<Note> get notes => _notes;

  // mengimplementasi state management untuk mengakses data dari database
  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllNotes();
  }

  // mendapatkan data notes dari database ketika pertama kali objek DbProvider dibuat
  void _getAllNotes() async {
    _notes = await _dbHelper.getNotes();
    notifyListeners();
  }

  // menambahkan data ke dalam database
  Future<void> addNote(Note note) async {
    await _dbHelper.insertNote(note);
    _getAllNotes();
  }

  // mengembalikan data berdasarkan id-nya
  Future<Note> getNoteById(int id) async {
    return await _dbHelper.getNoteById(id);
  }

  // metode untuk memperbarui dan menghapus data
  void updateNote(Note note) async {
    await _dbHelper.updateNote(note);
    _getAllNotes();
  }

  void deleteNote(int id) async {
    await _dbHelper.deleteNote(id);
    _getAllNotes();
  }
}
