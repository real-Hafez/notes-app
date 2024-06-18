import 'package:flutter/material.dart';
import 'package:notes_app/widgets/Custom_icon.dart';

class custom_app_bar extends StatelessWidget {
  const custom_app_bar({
    super.key,
    required this.title,
    required this.icon,
    this.onpressed,
  });
  final IconData icon;
  final void Function()? onpressed;

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 10,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        const Spacer(),
        custom_search_icon(
          onpressed: onpressed,
          icon: icon,
        )
      ],
    );
  }
}
