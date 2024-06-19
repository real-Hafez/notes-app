import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class color_item extends StatelessWidget {
  const color_item({super.key, required this.isactive, required this.colors});
  final bool isactive;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return isactive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: colors,
            ),
          )
        : CircleAvatar(
            radius: 32,
            backgroundColor: colors,
          );
  }
}

class color_list_view extends StatefulWidget {
  const color_list_view({
    super.key,
  });

  @override
  State<color_list_view> createState() => _color_list_viewState();
}

class _color_list_viewState extends State<color_list_view> {
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              current_index = index;
              BlocProvider.of<AddNoteCubit>(context).color = colors[index];
              setState(() {});
            },
            child: color_item(
              colors: colors[index],
              isactive: current_index == index,
            ),
          ),
        ),
      ),
    );
  }
}
