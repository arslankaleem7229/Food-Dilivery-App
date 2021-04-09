import 'package:flutter/material.dart';

TextStyle kTextStyle(double size, FontWeight fontWeight,
    {double letterSpacing, Color color}) {
  return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      color: color);
}
