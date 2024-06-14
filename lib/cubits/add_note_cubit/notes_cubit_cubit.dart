import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial()) {
    fetchallnotes(); // Fetch notes on initialization
  }

  List<notemodel>? notes;

  void fetchallnotes() async {
    emit(Noteloading()); // Emit loading state
    try {
      var notesBox = Hive.box<notemodel>('notes');
      notes = notesBox.values.toList();
      emit(Notesucsess(notes!));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
