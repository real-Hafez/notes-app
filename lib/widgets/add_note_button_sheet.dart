import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class add_note_button_sheet extends StatelessWidget {
  const add_note_button_sheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          custom_text_field(
            hint: 'title',
            maxlines: 2,
          ),
          Spacer(
            flex: 2,
          ),
          custom_text_field(hint: 'content', maxlines: 10),
          Spacer(
            flex: 8,
          ),
        ],
      ),
    );
  }
}
