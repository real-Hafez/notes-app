import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class Add_Note_Form extends StatefulWidget {
  Add_Note_Form({super.key});

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
            hint: 'Title',
            maxlines: 2,
          ),
          const SizedBox(height: 20),
          custom_text_field(
            onSaved: (value) => subtitle = value,
            hint: 'Content',
            maxlines: 5,
          ),
          const SizedBox(height: 30),
          custom_button(
            onTap: () {
              if (formkey.currentState?.validate() ?? false) {
                formkey.currentState?.save();
                var noteModel = notemodel(
                  title: title!,
                  subtitle: subtitle!,
                  date: DateTime.now().toString(),
                  color: Colors.green.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
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
