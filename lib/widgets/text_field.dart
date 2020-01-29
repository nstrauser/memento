import 'package:flutter/material.dart';
import '../shared/theme.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final style;
  final onChanged;
  final labelText;
  final labelStyle;
  final hintText;

  MyTextField(
      {this.controller,
      this.style,
      this.onChanged,
      this.labelText,
      this.labelStyle,
      this.hintText,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColorLight,
      controller: controller,

      style: style,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
          fillColor: Color(0xff072238),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColorLight, width: 2.0)),
          filled: true,
          hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
          labelText: labelText,
          labelStyle: labelStyle,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kSecondaryColorDark, width: 1.0),
            borderRadius: BorderRadius.circular(5.0),
          )),
    );
  }
}
