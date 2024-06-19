import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';
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
          const SizedBox(height: 30),
          custom_text_field(
            onSaved: (value) => title = value,
            hint: 'Title',
            maxlines: 2,
          ),
          const SizedBox(height: 30),
          custom_text_field(
            onSaved: (value) => subtitle = value,
            hint: 'Content',
            maxlines: 5,
          ),
          const SizedBox(height: 30),
          const color_list_view(),
          const SizedBox(height: 30),
          BlocListener<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNotesucsess) {
                // Handle the success state, e.g., by showing a Snackbar or updating the UI
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                    'Note added successfully',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                );
                // You can also update the UI or clear the form fields here if needed
              } else if (state is AddNotefailure) {
                // Handle the failure state
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to add note: ${state.error}')),
                );
              }
            },
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return custom_button(
                  isloading: state is AddNoteloading,
                  onTap: () {
                    var current_date = DateTime.now();
                    var formated_cureent_date =
                        DateFormat.yMEd().format(current_date);
                    if (formkey.currentState?.validate() ?? false) {
                      formkey.currentState?.save();
                      var noteModel = notemodel(
                        title: title!,
                        subtitle: subtitle!,
                        color: Colors.green.value,
                        date: formated_cureent_date,
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
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
