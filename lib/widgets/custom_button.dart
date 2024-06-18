import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class custom_button extends StatefulWidget {
  const custom_button(
      {super.key, required this.onTap, required this.isloading});

  final void Function()? onTap;
  final bool isloading;

  @override
  State<custom_button> createState() => _custom_buttonState();
}

class _custom_buttonState extends State<custom_button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: kprimarycolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: widget.isloading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  
                ),
                
        ),
        
      ),
      
    );
  }

  
}
