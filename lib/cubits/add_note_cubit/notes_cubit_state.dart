part of 'notes_cubit_cubit.dart';

@immutable
abstract class NotesCubitState {}

class NotesCubitInitial extends NotesCubitState {}

class Noteloading extends NotesCubitState {}

class Notesucsess extends NotesCubitState {
  final List<notemodel> notes;

  Notesucsess(this.notes);
}

class NoteFailure extends NotesCubitState {
  final String error;

  NoteFailure(this.error);
}
