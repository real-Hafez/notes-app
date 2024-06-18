import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = Colors.red;

  Future<void> addNote(notemodel note) async {
    note.color = color.value;
    try {
    emit(AddNoteloading());
      var notesBox = Hive.box<notemodel>('notes');
      await notesBox.add(note);
      emit(AddNotesucsess(note)); // Emit the new note on success
    } catch (e) {
      emit(AddNotefailure(error: e.toString()));
    }
  }
}
