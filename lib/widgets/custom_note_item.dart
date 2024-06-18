import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/models/note_model.dart';

class note_item extends StatelessWidget {
  final notemodel note;
  final Animation<double> animation;
  final VoidCallback onDelete;

  const note_item({
    super.key,
    required this.note,
    required this.animation,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteView(
                note: note,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 12,
          ),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 42,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    note.subtitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 26,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    onDelete();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 26),
                child: Text(
                  note.date,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
