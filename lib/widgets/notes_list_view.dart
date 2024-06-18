import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<notemodel> notes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesCubitState>(
      builder: (context, state) {
        if (state is NotesCubitInitial || state is Noteloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Notesucsess) {
          notes = state.notes;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: AnimatedList(
              key: _listKey,
              initialItemCount: notes.length,
              itemBuilder: (context, index, animation) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: note_item(
                    note: notes[index],
                    animation: animation,
                    onDelete: () {
                      _removeItem(index);
                    },
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(child: Text('Failed to load notes'));
        }
        
        
      },
      
    );
    
  }

  void _removeItem(int index) {
    final removedNote = notes.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => note_item(
        note: removedNote,
        animation: animation,
        onDelete: () {},
      ),
      duration: const Duration(milliseconds: 600),
    );
    // Call fetchAllNotes() or your logic to update the state
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }
}
