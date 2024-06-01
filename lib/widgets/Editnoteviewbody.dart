import 'package:flutter/material.dart';
import 'package:notes_app/widgets/Custom_app_bar.dart';

class Editnoteviewbody extends StatelessWidget {
  const Editnoteviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          custom_app_bar(
            title: 'Edit note',
            icon: Icons.check,
          ),
        ],
      ),
    );
  }
}
