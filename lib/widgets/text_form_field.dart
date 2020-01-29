import 'package:flutter/material.dart';
import 'package:memento/shared/theme.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    this.hintText,
    this.controller
  });
  final hintText;
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hoverColor: Color(0xff2d2d2d),
        filled: true,
        fillColor: Color(0xff2d2d2d),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: kPrimaryColor,
                width: 2.0
            ),
            borderRadius: BorderRadius.circular(3.0)),
//        contentPadding: EdgeInsets.only(left: 8.0),
        labelStyle: TextStyle(),
        hintText: "$hintText",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0)),
      ),
      textAlign: TextAlign.right,
    );
  }
}