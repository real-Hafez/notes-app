part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

final class Noteloading extends NotesCubitState {}

final class Notesucsess extends NotesCubitState {
  final List<notemodel> notes;

  Notesucsess(this.notes);
}

final class Notefailure extends NotesCubitState {
  final String error_msg;

  Notefailure({required this.error_msg});
}
