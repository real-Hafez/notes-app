import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class notes_view extends StatelessWidget {
  const notes_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const notes_view_body(),
    );
  }
}
