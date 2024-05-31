import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/Custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class notes_view_body extends StatelessWidget {
  const notes_view_body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          custom_app_bar(),
          note_item(),
        ],
      ),
    );
  }
}
