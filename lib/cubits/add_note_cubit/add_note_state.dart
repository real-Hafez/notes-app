part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteloading extends AddNoteState {}

class AddNotesucsess extends AddNoteState {
  final notemodel note;
  AddNotesucsess(this.note);
}

class AddNotefailure extends AddNoteState {
  final String error;
  AddNotefailure({required this.error});
}
