import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class notes_list_view extends StatelessWidget {
  const notes_list_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (
          context,
          index,
        ) =>
            const Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: note_item(),
        ),
      ),
    );
  }
}
