// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        // ignore: prefer_const_constructors
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black38,
        )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
  
}
