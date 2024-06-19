import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/models/note_model.dart';

class note_item extends StatefulWidget {
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
  _note_itemState createState() => _note_itemState();
}

class _note_itemState extends State<note_item> {
  bool isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: widget.animation,
      axis: Axis.vertical,
      child: GestureDetector(
        onTap: () {
          if (!isDeleted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNoteView(
                  note: widget.note,
                ),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 12,
          ),
          decoration: BoxDecoration(
            color: Color(widget.note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  widget.note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 42,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.note.subtitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 26,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      isDeleted = true;
                    });
                    widget.note.delete();
                    widget.onDelete();
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
                  widget.note.date,
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
