import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class notes_view extends StatelessWidget {
  const notes_view({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: notes_view_body(),
    );
  }
}
