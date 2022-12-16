import 'package:flutter/material.dart';

Widget button({ButtonStyle? buttonstyle,Function()? onPressed, required String text, TextStyle? style}) {
  return ElevatedButton(onPressed: onPressed, child: Text(text, style: style),
  style: buttonstyle,);
}

Widget textField() {
  return TextField();
}
