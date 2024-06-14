import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class notes_list_view extends StatelessWidget {
  const notes_list_view({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesCubitState>(
      builder: (context, state) {
        if (state is NotesCubitInitial || state is Noteloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Notesucsess) {
          List<notemodel> notes = state.notes;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: note_item(note: notes[index]),
              ),
            ),
          );
        } else {
          return const Center(child: Text('Failed to load notes'));
        }
      },
    );
  }
}
