import 'package:dartz/dartz.dart';
import 'package:note_app/data/models/note.model.dart';
import 'package:note_app/domain/entities/note.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class NoteRemoteDataSource {
  Future<List<NoteModel>> getAllNotes();
  Future<Unit> addNote(NoteModel note);
  Future<Unit> updateNote(NoteModel note);
  Future<Unit> removeNote(int id);
}

class NoteRemoteDataSourceImpl implements NoteRemoteDataSource {
  NoteRemoteDataSourceImpl() {}

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final SupabaseClient client = Supabase.instance.client;
    final response = await client.from('notes').select();
    return response.map((json) => NoteModel.fromJson(json)).toList();
  }

  @override
  Future<Unit> addNote(NoteModel note) async {
    final SupabaseClient client = Supabase.instance.client;

    // Menyaring kolom 'id' dari objek Note yang akan dikirim
    final Map<String, dynamic> noteData = note.toJson();

    // Menghapus 'id' dari map jika ada
    noteData.remove('id');

    await client.from('notes').insert(noteData);

    return unit;
  }

  @override
  Future<Unit> updateNote(NoteModel note) async {
    final SupabaseClient client = Supabase.instance.client;
    // Hanya perbarui kolom yang relevan (title, content) tanpa menyertakan id
    await client.from('notes').update({
      'title': note.title,
      'content': note.content,
    }).eq('id',
        note.id!); // id tetap digunakan sebagai kondisi, tetapi tidak diperbarui
    return unit;
  }

  @override
  Future<Unit> removeNote(int id) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('notes').delete().eq('id', id);
    return unit;
  }
}
