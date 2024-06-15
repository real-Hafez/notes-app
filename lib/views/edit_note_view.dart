import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/Editnoteviewbody.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final notemodel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Editnoteviewbody(
        note: note,
      ),
    );
  }
}
