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
          SizedBox(height: 35),
          custom_text_field(
            onSaved: (value) => title = value,
            hint: 'Title',
            maxlines: 2,
          ),
          SizedBox(height: 20),
          custom_text_field(
            onSaved: (value) => subtitle = value,
            hint: 'Content',
            maxlines: 5,
          ),
          SizedBox(height: 30),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return custom_button(
                isloading: state is AddNoteloading ? true : false,
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
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
