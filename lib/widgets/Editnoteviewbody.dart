import 'package:flutter/material.dart';
import 'package:notes_app/widgets/Custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class Editnoteviewbody extends StatelessWidget {
  const Editnoteviewbody({Key? key});

  @override
  Widget build(BuildContext context) {
    String? title; // Declare title variable
    String? sub_title; // Declare sub_title variable

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const custom_app_bar(
            title: 'Edit note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          custom_text_field(
            onSaved: (value) {
              title = value;
            },
            hint: 'title',
            maxlines: 2,
          ),
          const SizedBox(
            height: 15,
          ),
          custom_text_field(
            onSaved: (value) {
              sub_title = value;
            },
            hint: 'content',
            maxlines: 5,
          ),
        ],
      ),
    );
  }
}
