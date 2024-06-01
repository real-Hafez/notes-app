import 'package:flutter/material.dart';
import 'package:notes_app/widgets/Custom_icon.dart';

class custom_app_bar extends StatelessWidget {
  const custom_app_bar({
    super.key,
    required this.title,
    required this.icon,
  });
  final IconData icon;

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(top: 60, left: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        const Spacer(),
        custom_search_icon(
          icon: icon,
        )
      ],
    );
  }
}
