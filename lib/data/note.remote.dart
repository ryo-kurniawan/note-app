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
    await client.from('notes').insert(note.toJson());
    return unit;
  }

  @override
  Future<Unit> updateNote(NoteModel note) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('notes').update(note.toJson()).eq('id', note.id!);
    return unit;
  }

  @override
  Future<Unit> removeNote(int id) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('notes').delete().eq('id', id);
    return unit;
  }
}
