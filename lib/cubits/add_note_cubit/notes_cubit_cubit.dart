import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial()) {
    fetchAllNotes(); // Fetch notes on initialization
  }

  List<notemodel>? notes;

  void fetchAllNotes() async {
    emit(Noteloading()); // Emit loading state
    try {
      var notesBox = Hive.box<notemodel>('notes');
      notes = notesBox.values.toList();
      emit(Notesucsess(notes!));
    } catch (e) {
      emit(NoteFailure('Failed to fetch notes: ${e.toString()}'));
    }
  }

  void addNote(notemodel note) async {
    try {
      var notesBox = Hive.box<notemodel>('notes');
      await notesBox.add(note);
      fetchAllNotes(); // Refresh the notes list after adding a new note
    } catch (e) {
      emit(NoteFailure('Failed to add note: ${e.toString()}'));
    }
  }

  void deleteNote(int index) async {
    try {
      var notesBox = Hive.box<notemodel>('notes');
      await notesBox.deleteAt(index);
      fetchAllNotes(); // Refresh the notes list after deleting a note
    } catch (e) {
      emit(NoteFailure('Failed to delete note: ${e.toString()}'));
    }
  }
}
