import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';

class edit_notes_colors_list extends StatefulWidget {
  const edit_notes_colors_list({super.key, required this.note});
  final notemodel note;
  @override
  State<edit_notes_colors_list> createState() => _edit_notes_colors_listState();
}

class _edit_notes_colors_listState extends State<edit_notes_colors_list> {
  late int current_indexx;
  @override
  void initState() {
    current_indexx = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              current_indexx = index;
              widget.note.color = colors[index].value;
              setState(() {});
            },
            child: color_item(
              colors: colors[index],
              isactive: current_indexx == index,
            ),
          ),
        ),
      ),
    );
  }
}
