import 'package:flutter/material.dart';

class custom_search_icon extends StatelessWidget {
  const custom_search_icon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 10),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Icon(
            Icons.search,
            size: 28,
          ),
        ),
      ),
    );
  }
}
