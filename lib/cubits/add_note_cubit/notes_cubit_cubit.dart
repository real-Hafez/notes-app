import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial());
  List<notemodel>? notes;
  fetchallnotes() {
    var notesBox = Hive.box<notemodel>(notes as String);
    notes = notesBox.values.toList as List<notemodel>?;
  }
}
