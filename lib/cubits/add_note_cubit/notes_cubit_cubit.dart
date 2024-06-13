import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  fetchallnotes() async {
    try {
      emit(Noteloading());
      var notesBox = Hive.box<notemodel>('notes'); // Use the correct box name
    emit(Notesucsess(notesBox.values.toList()));
    } catch (e) {
      emit(Notefailure(error_msg: e.toString()));
    }
  }
}
