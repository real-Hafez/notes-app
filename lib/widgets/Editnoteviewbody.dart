import 'package:flutter/material.dart';
import 'package:notes_app/widgets/Custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

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
          SizedBox(
            height: 50,
          ),
          custom_text_field(
            hint: 'title',
            maxlines: 2,
          ),
          SizedBox(
            height: 15,
          ),
          custom_text_field(
            hint: 'content',
            maxlines: 5,
          ),
        ],
      ),
    );
  }
}
