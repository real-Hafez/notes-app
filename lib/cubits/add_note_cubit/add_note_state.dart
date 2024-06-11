part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteloading extends AddNoteState {}

final class AddNotesucsess extends AddNoteState {}

final class AddNotefailure extends AddNoteState {
  final String error;

  AddNotefailure({required this.error});
}
