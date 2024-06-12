import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Future<void> addNote(notemodel note) async {
    try {
      emit(AddNoteloading());
      var notesBox = Hive.box<notemodel>('notes'); // Use the correct box name
      await notesBox.add(note);
      emit(AddNotesucsess());
    } catch (e) {
      emit(AddNotefailure(error: e.toString()));
    }
  }
}
