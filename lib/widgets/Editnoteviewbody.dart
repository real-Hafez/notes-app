import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/Custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_note_color_list_view.dart';

class Editnoteviewbody extends StatefulWidget {
  const Editnoteviewbody({Key? key, required this.note});
  final notemodel note;
  @override
  State<Editnoteviewbody> createState() => _EditnoteviewbodyState();
}

class _EditnoteviewbodyState extends State<Editnoteviewbody> {
  @override
  Widget build(BuildContext context) {
    String? title; // Declare title variable
    String? sub_title; // Declare sub_title variable

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          custom_app_bar(
            onpressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = sub_title ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          custom_text_field(
            onchanged: (value) {
              title = value;
            },
            hint: widget.note.title,
            maxlines: 2,
          ),
          const SizedBox(
            height: 15,
          ),
          custom_text_field(
            onchanged: (value) {
              sub_title = value;
            },
            hint: widget.note.subtitle,
            maxlines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          edit_notes_colors_list(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
