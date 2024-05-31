import 'package:flutter/material.dart';

class note_item extends StatelessWidget {
  const note_item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        bottom: 24,
        left: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffeFCC8e),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'flutter tips',
              style: TextStyle(
                color: Colors.black,
                fontSize: 42,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Build your carrer with me ',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 26,
                ),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 40,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 26),
            child: Text(
              'may 21 ... 2024',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          )
        ],
      ),
    );
  }
}
