import 'package:flutter/material.dart';
import '../shared/theme.dart';

class MySwitch extends StatelessWidget {
  final value;
  final onChanged;

  MySwitch({this.value, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: onChanged,
      value: value,
      inactiveTrackColor: Colors.grey[800],
      activeTrackColor: kSecondaryColor,
      activeColor: kSecondaryColorLight,
      inactiveThumbColor: Colors.grey[600],
    );
  }
}

