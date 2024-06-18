import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class custom_search_icon extends StatelessWidget {
  const custom_search_icon({super.key, required this.icon, this.onpressed});
  final IconData icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60, left: 10),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(16),
        ),
        child: IconButton(
          onPressed: onpressed,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
