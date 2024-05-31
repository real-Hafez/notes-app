import 'package:flutter/material.dart';
import 'package:notes_app/widgets/Custom_icon.dart';

class custom_app_bar extends StatelessWidget {
  const custom_app_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          height: 150,
        ),
        Text(
          'Notes',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        Spacer(),
        custom_search_icon()
      ],
    );
  }
}
