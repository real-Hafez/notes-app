import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class custom_text_field extends StatelessWidget {
  const custom_text_field(
      {super.key, required this.hint, required this.maxlines});
  final String hint;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      cursorColor: kprimarycolor,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: kprimarycolor,
          ),
          border: build_border(),
          enabledBorder: build_border(),
          focusedBorder: build_border(kprimarycolor)),
    );
  }

  OutlineInputBorder build_border([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
