import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class custom_text_field extends StatelessWidget {
  custom_text_field(
      {super.key, this.onSaved, required this.hint, required this.maxlines, this.onchanged});

  final String hint;
  final int maxlines;
  final void Function(String?)? onSaved;
  final Function(String)? onchanged; 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }
        return null;
      },
      maxLines: maxlines,
      cursorColor: kprimarycolor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: kprimarycolor,
        ),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(kprimarycolor),
      ),
    );
  }

  OutlineInputBorder _buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
