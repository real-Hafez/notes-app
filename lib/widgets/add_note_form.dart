import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class Add_Note_Form extends StatefulWidget {
  Add_Note_Form({
    super.key,
  });

  @override
  State<Add_Note_Form> createState() => _Add_Note_FormState();
}

class _Add_Note_FormState extends State<Add_Note_Form> {
  String? title, subtitle;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 35),
          custom_text_field(
            onSaved: (value) => title = value,
            hint: 'title',
            maxlines: 2,
          ),
          const SizedBox(height: 20),
          custom_text_field(
            onSaved: (value) => subtitle = value,
            hint: 'content',
            maxlines: 5,
          ),
          const SizedBox(height: 30),
          custom_button(
            onTap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
              }
            },
            onPressed: () {
              if (formkey.currentState?.validate() ?? false) {
                formkey.currentState?.save();
                // Save the note or perform any necessary actions with `title` and `subtitle`
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}